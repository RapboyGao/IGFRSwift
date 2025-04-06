
import Foundation
import Numerics

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public struct IGRFCalculator {
    /// 计算指定位置和时间的磁场
    public static func calculate(
        latitude: Double, // 地理纬度（度）
        longitude: Double, // 地理经度（度）
        altitude: Double, // 海拔高度（千米）
        date: Date // 时间
    ) throws -> GeomagneticResult {
        // 输入验证
        guard (-90...90).contains(latitude) else { throw IGRFError.invalidLatitude }
        guard (-180...180).contains(longitude) else { throw IGRFError.invalidLongitude }
        guard altitude >= -6371.0 else { throw IGRFError.invalidAltitude }
        
        let model = SHCModel.model14
        let year = date.decimalYear
        guard year >= model.minYear, year <= model.maxYear else {
            throw IGRFError.dateOutOfRange
        }
        
        // 地理坐标转地心坐标
        let converter = GeodeticToGeocentricConverter(
            h: altitude,
            gdColatitude: 90.0 - latitude // 地理余纬度
        )
        
        // 计算插值后的球谐系数
        let coefficients = try interpolateCoefficients(model: model, year: year)
        
        // 计算施密特多项式
        let theta = converter.theta // 地心余纬度（度）
        let schmidt = SchmidtLegendrePolynomial(nmax: model.degree, theta: [theta])
        
        // 计算磁场分量
        let (x, y, z) = try calculateComponents(
            coefficients: coefficients,
            schmidt: schmidt,
            radius: converter.radius,
            theta: theta,
            phi: longitude,
            a: 6371.2 // 地球参考半径（千米）
        )
        
        // 坐标旋转（地心到地理）
        let xGeo = x * converter.cosDelta - z * converter.sinDelta
        let zGeo = x * converter.sinDelta + z * converter.cosDelta
        
        return GeomagneticResult(x: xGeo, y: y, z: zGeo)
    }
    
    // MARK: - 辅助方法
    
    /// 时间插值球谐系数
    private static func interpolateCoefficients(model: SHCModel, year: Double) throws -> [SHCCoefficient] {
        guard !model.years.isEmpty else { throw IGRFError.modelDataUnavailable }
        
        // 寻找最近的年份节点
        let years = model.years
        guard let lowerIndex = years.lastIndex(where: { $0 <= year }) else {
            throw IGRFError.dateOutOfRange
        }
        
        if lowerIndex == years.count - 1 {
            // 使用最后一个节点
            return model.coefficients.map { coeff in
                SHCCoefficient(
                    n: coeff.n, m: coeff.m, type: coeff.type,
                    values: [coeff.values[lowerIndex]]
                )
            }
        }
        
        let upperIndex = lowerIndex + 1
        let t = (year - years[lowerIndex]) / (years[upperIndex] - years[lowerIndex])
        
        return model.coefficients.map { coeff in
            let lower = coeff.values[lowerIndex]
            let upper = coeff.values[upperIndex]
            let value = lower + (upper - lower) * t
            return SHCCoefficient(
                n: coeff.n, m: coeff.m, type: coeff.type, values: [value]
            )
        }
    }
    
    /// 计算磁场分量
    private static func calculateComponents(
        coefficients: [SHCCoefficient],
        schmidt: SchmidtLegendrePolynomial,
        radius: Double,
        theta: Double,
        phi: Double,
        a: Double
    ) throws -> (x: Double, y: Double, z: Double) {
        let thetaRad = theta.toRadians()
        let phiRad = phi.toRadians()
        let aOverR = a / radius
        
        var x = 0.0, y = 0.0, z = 0.0
        
        // 预计算三角函数
        var sinMPHI = [Double](repeating: 0.0, count: schmidt.pnm.count)
        var cosMPHI = [Double](repeating: 0.0, count: schmidt.pnm.count)
        for m in 0 ..< sinMPHI.count {
            sinMPHI[m] = sin(Double(m) * phiRad)
            cosMPHI[m] = cos(Double(m) * phiRad)
        }
        
        for coeff in coefficients {
            let n = coeff.n
            let m = coeff.m
            guard n >= 1, m <= n else { continue }
            
            let value = coeff.values.first ?? 0.0
            let p = schmidt.pnm[n][m][0] // 多项式值
            let dp = schmidt.pnm[m][n + 1][0] // 导数
            
            let aOverRPower = pow(aOverR, Double(n + 1))
            var term: Double
            
            switch coeff.type {
            case .g:
                term = value * cosMPHI[m]
            case .h:
                term = value * sinMPHI[m]
            }
            
            term *= aOverRPower
            
            // X分量：-1/r * Σ (dP/dθ * term)
            x += term * dp
            
            // Y分量：Σ (m * P / sinθ * term)
            if m > 0, thetaRad != 0, thetaRad != .pi {
                y += Double(m) * p * term / sin(thetaRad)
            }
            
            // Z分量：Σ (n+1) * P * term
            z += (Double(n) + 1.0) * p * term
        }
        
        // 应用全局因子
        x = -x / radius
        y = y / radius
        z = -z * (a / (radius * radius))
        
        return (x, y, z)
    }
}
