//
//  IGFRError.swift
//  IGFRSwift
//
//  Created by 高效奕 on 2025/4/4.
//


//  SHCModel+IGRFCalculation.swift
//  IGFRSwift

import Foundation
import CoreLocation
import Accelerate

// MARK: - 错误处理

/// 国际地磁参考场计算错误类型
public enum IGFRError: Error {
    /// 日期超出模型外推能力范围
    case dateBeyondExtrapolationLimit
    /// 无效的地理位置（纬度超出[-90°, 90°]范围）
    case invalidLatitude
    /// 无效的地理位置（经度超出[-180°, 180°]范围）
    case invalidLongitude
    /// 无效的海拔高度（超过地心坐标系合理范围）
    case invalidAltitude
    /// 模型数据不完整（缺少必要阶次的系数）
    case incompleteModelData
}

// MARK: - SHCModel 扩展
@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension SHCModel {
    
    // MARK: - 主计算函数
    
    /// 计算指定位置和时间的国际地磁参考场参数
    /// - Parameters:
    ///   - location: 包含纬度（°）、经度（°）和海拔高度（米）的地理位置
    ///   - date: 目标日期（十进制年表示，如2020.5表示2020年6月）
    /// - Returns: 包含计算结果或错误的Result类型
    func calculateIGRF(
        at location: CLLocation,
        for date: Date
    ) -> Result<GeomagneticResult, IGFRError> {
        // 将日期转换为十进制年
        let decimalYear = date.decimalYear
        
        // 坐标转换和预处理
        let coordinateConversionResult = prepareCoordinateSystemParameters(
            latitude: location.coordinate.latitude,
            longitude: location.coordinate.longitude,
            altitude: location.altitude
        )
        
        switch coordinateConversionResult {
        case .success(let (sphericalCoords, sinPhi, cosPhi)):
            // 计算时间相关系数
            guard let coefficients = computeTimeDependentCoefficients(
                decimalYear: decimalYear
            ) else {
                return .failure(.incompleteModelData)
            }
            
            // 执行球谐展开计算
            let magneticComponents = performSphericalHarmonicExpansion(
                sphericalCoords: sphericalCoords,
                sinPhi: sinPhi,
                cosPhi: cosPhi,
                coefficients: coefficients
            )
            
            // 转换坐标系并计算衍生参数
            return .success(calculateDerivedParameters(
                magneticComponents: magneticComponents,
                longitude: location.coordinate.longitude
            ))
            
        case .failure(let error):
            return .failure(error)
        }
    }
    
    // MARK: - 坐标转换
    
    /// 将地理坐标转换为地磁球坐标系参数
    /// - Parameters:
    ///   - latitude: 地理纬度（°）
    ///   - longitude: 地理经度（°）
    ///   - altitude: 海拔高度（米）
    /// - Returns: 包含转换结果或错误的Result类型
    private func prepareCoordinateSystemParameters(
        latitude: CLLocationDegrees,
        longitude: CLLocationDegrees,
        altitude: CLLocationDistance
    ) -> Result<(
        sphericalCoords: (radius: Double, theta: Double, phi: Double),
        sinPhi: Double,
        cosPhi: Double
    ), IGFRError> {
        // 验证输入参数有效性
        guard (-90...90).contains(latitude) else {
            return .failure(.invalidLatitude)
        }
        guard (-180...180).contains(longitude) else {
            return .failure(.invalidLongitude)
        }
        guard altitude >= -10000 && altitude <= 100000 else {
            return .failure(.invalidAltitude)
        }
        
        // 将地理坐标转换为球坐标系参数
        let (radius, theta) = calculateGeocentricCoordinates(
            latitude: latitude,
            altitude: altitude
        )
        let phi = longitude.toRadians()
        
        // 预计算三角函数值
        let (sinPhi, cosPhi) = (sin(phi), cos(phi))
        
        return .success((
            sphericalCoords: (radius, theta, phi),
            sinPhi: sinPhi,
            cosPhi: cosPhi
        ))
    }
    
    /// 计算地心坐标系参数（使用WGS84参考椭球）
    /// - Parameters:
    ///   - latitude: 地理纬度（°）
    ///   - altitude: 海拔高度（米）
    /// - Returns: 地心半径（千米）和地心纬度（弧度）
    private func calculateGeocentricCoordinates(
        latitude: CLLocationDegrees,
        altitude: CLLocationDistance
    ) -> (radius: Double, theta: Double) {
        // WGS84椭球参数
        let a: Double = 6378.137 // 赤道半径（千米）
        let f: Double = 1/298.257223563 // 扁率
        let _: Double = a*(1 - f) // 极半径
        
        let latRad = latitude.toRadians()
        let h = altitude / 1000 // 转换为千米
        
        // 计算辅助参数
        let sinLat = sin(latRad)
        let cosLat = cos(latRad)
        let N = a / sqrt(1 - (2*f - f*f)*sinLat*sinLat)
        
        // 计算地心坐标
        let x = (N + h) * cosLat
        let z = (N*(1 - f)*(1 - f) + h) * sinLat
        let radius = sqrt(x*x + z*z)
        let theta = acos(z / radius)
        
        return (radius, theta)
    }
    
    // MARK: - 时间相关系数计算
    
    /// 计算时间依赖的球谐系数
    /// - Parameter decimalYear: 十进制年份
    /// - Returns: 插值后的系数字典 [n:m:g/h:value]
    private func computeTimeDependentCoefficients(
        decimalYear: Double
    ) -> [Int: [Int: [SHCCoefficientType: Double]]]? {
        // 确定时间插值参数
        let (lowerIndex, upperIndex, tFraction) = findTimeInterpolationIndices(
            decimalYear: decimalYear
        )
        
        // 构建系数字典
        var coefficients = [Int: [Int: [SHCCoefficientType: Double]]]()
        for coefficient in self.coefficients {
            // 使用vDSP进行线性插值
            var lowerValue = 0.0
            var upperValue = 0.0
            vDSP_vclipD(coefficient.values, 1,
                        [self.years[lowerIndex]], [self.years[upperIndex]],
                        &lowerValue, 1,
                        1)
            vDSP_vclipD(coefficient.values, 1,
                        [self.years[lowerIndex]], [self.years[upperIndex]],
                        &upperValue, 1,
                        1)
            
            let value = (1 - tFraction)*lowerValue + tFraction*upperValue
            
            if coefficients[coefficient.n] == nil {
                coefficients[coefficient.n] = [:]
            }
            if coefficients[coefficient.n]?[coefficient.m] == nil {
                coefficients[coefficient.n]?[coefficient.m] = [:]
            }
            coefficients[coefficient.n]?[coefficient.m]?[coefficient.type] = value
        }
        return coefficients
    }
    
    /// 寻找时间插值索引和系数
    /// - Parameter decimalYear: 目标年份
    /// - Returns: 时间插值参数
    private func findTimeInterpolationIndices(
        decimalYear: Double
    ) -> (lowerIndex: Int, upperIndex: Int, tFraction: Double) {
        // 处理时间外推
        let clampedYear = decimalYear.clamped(to: self.minYear...self.maxYear)
        let index = self.years.nearestLowerIndex(for: clampedYear)
        let lowerIndex = max(0, min(index, self.years.count - 2))
        let upperIndex = lowerIndex + 1
        
        let tFraction = (clampedYear - self.years[lowerIndex]) /
        (self.years[upperIndex] - self.years[lowerIndex])
        
        return (lowerIndex, upperIndex, tFraction)
    }
    
    // MARK: - 球谐展开计算
    
    /// 执行球谐函数展开计算
    private func performSphericalHarmonicExpansion(
        sphericalCoords: (radius: Double, theta: Double, phi: Double),
        sinPhi: Double,
        cosPhi: Double,
        coefficients: [Int: [Int: [SHCCoefficientType: Double]]]
    ) -> (X: Double, Y: Double, Z: Double) {
        let (radius, theta, _) = sphericalCoords
        let (_, cosTheta) = (sin(theta), cos(theta))
        
        // 预计算Schmidt半归一化关联Legendre多项式
        let P = computeSchmidtLegendrePolynomials(
            theta: theta,
            maxDegree: self.degree
        )
        
        // 初始化磁场分量
        var X = 0.0
        var Y = 0.0
        var Z = 0.0
        
        // 使用Accelerate加速计算
        var sumG = [Double](repeating: 0.0, count: self.degree + 1)
        var sumH = [Double](repeating: 0.0, count: self.degree + 1)
        
        for n in 1...self.degree {
            var gTerms = [Double]()
            var hTerms = [Double]()
            
            for m in 0...n {
                guard let coeffs = coefficients[n]?[m] else { continue }
                let Pnm = P[n][m]
                
                if let g = coeffs[.g] {
                    gTerms.append(g * Pnm)
                }
                if m > 0, let h = coeffs[.h] {
                    hTerms.append(h * Pnm)
                }
            }
            
            // 使用vDSP加速求和
            sumG[n] = vDSP.sum(gTerms)
            sumH[n] = vDSP.sum(hTerms)
        }
        
        // 计算最终磁场分量
        let a = 6371.2 // 参考半径（千米）
        let rRatio = a / radius
        var rRatioPower = pow(rRatio, Double(self.degree) + 2)
        
        for n in 1...self.degree {
            let nDouble = Double(n)
            let derivative = sqrt(nDouble*(nDouble + 1))
            
            X += (sumG[n] * cosTheta - sumH[n]) * derivative * rRatioPower
            Y += sumH[n] * derivative * rRatioPower
            Z += (nDouble + 1) * (sumG[n] * cosTheta - sumH[n]) * rRatioPower
            
            rRatioPower *= rRatio
        }
        
        return (X, Y, Z)
    }
    
    /// 计算Schmidt半归一化关联Legendre多项式
    private func computeSchmidtLegendrePolynomials(
        theta: Double,
        maxDegree: Int
    ) -> [[Double]] {
        let cosTheta = cos(theta)
        var P = [[Double]](repeating: [Double](repeating: 0.0, count: maxDegree + 1),
                           count: maxDegree + 1)
        
        // 初始化递归关系
        P[0][0] = 1.0
        P[1][1] = sin(theta)
        
        // 使用递推计算
        for n in 1...maxDegree {
            P[n][n] = sqrt(1 - 1.0/(2*Double(n))) * sin(theta) * P[n-1][n-1]
        }
        
        for n in 1..<maxDegree {
            for m in 0...n {
                let k = (n >= m + 1) ? (2*Double(n) + 1)/(Double(n) - Double(m) + 1) : 0
                let term1 = (2*Double(n) + 1) * cosTheta * P[n][m]
                let term2 = (Double(n) + Double(m)) * P[n-1][m]
                P[n+1][m] = (k != 0) ? (term1 - term2)/k : 0
            }
        }
        
        return P
    }
    
    // MARK: - 结果计算
    
    /// 计算衍生磁场参数
    private func calculateDerivedParameters(
        magneticComponents: (X: Double, Y: Double, Z: Double),
        longitude: CLLocationDegrees
    ) -> GeomagneticResult {
        let (X, Y, Z) = magneticComponents
        
        // 计算总强度和水平强度
        let H = sqrt(X*X + Y*Y)
        let F = sqrt(X*X + Y*Y + Z*Z)
        
        // 计算磁偏角（弧度）
        var D = atan2(Y, X)
        // 转换为地理坐标系
        D += longitude.toRadians()
        
        // 计算磁倾角
        let I = (H < 1e-5) ? (Z >= 0 ? .pi/2 : -.pi/2) : atan(Z/H)
        
        // 处理角度范围
        D = fmod(D + 3 * .pi, 2 * .pi) - .pi
        
        return GeomagneticResult(
            x: X,
            y: Y,
            z: Z,
            totalIntensity: F,
            horizontalIntensity: H,
            inclination: I.toDegrees(),
            declination: D.toDegrees()
        )
    }
}

// MARK: - 辅助扩展

private extension Date {
    /// 将日期转换为十进制年表示
    var decimalYear: Double {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: self)
        let dayOfYear = calendar.ordinality(of: .day, in: .year, for: self)!
        return Double(year) + Double(dayOfYear)/365.25
    }
}

private extension Array where Element == Double {
    /// 寻找最近的下界索引（用于时间插值）
    func nearestLowerIndex(for value: Double) -> Int {
        var low = 0
        var high = count - 1
        
        while low <= high {
            let mid = (low + high)/2
            if self[mid] < value {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        return Swift.max(0, high)
    }
}

private extension Comparable {
    /// 限制数值在指定范围内
    func clamped(to limits: ClosedRange<Self>) -> Self {
        min(max(self, limits.lowerBound), limits.upperBound)
    }
}

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
private extension vDSP {
    /// 使用Accelerate加速数组求和
    static func sum(_ input: [Double]) -> Double {
        var result = 0.0
        vDSP_sveD(input, 1, &result, vDSP_Length(input.count))
        return result
    }
}
