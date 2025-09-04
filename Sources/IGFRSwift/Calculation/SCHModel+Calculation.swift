import Foundation

// 地球参考半径（km）
private let RE = 6371.2
// World Geodetic System 84 parameters:
private let WGS84_e2 = 0.00669437999014
private let WGS84_a = 6378.137 // km

public extension SHCModel {
    func isLeapYear(_ year: Int) -> Bool {
        (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
    }

    func dateToDecimalYear(_ date: Date) -> Double {
        let calendar = Calendar(identifier: .gregorian)
        let year = calendar.component(.year, from: date)
        guard let dayOfYear = calendar.ordinality(of: .day, in: .year, for: date),
              let daysInYearRange = calendar.range(of: .day, in: .year, for: date)
        else {
            return Double(year)
        }
        let daysInYear = daysInYearRange.count
        // 原逻辑已经通过 calendar.range(of:in:for:) 自动考虑了闰年情况，无需额外处理
        return Double(year) + Double(dayOfYear - 1)/Double(daysInYear)
    }
    
    /// 计算IGRF模型值（地磁坐标系输入输出）
    /// - Parameters:
    ///   - lon: 经度角度，东向为正 (度)
    ///   - lat: 地磁纬度角度 (度)
    ///   - h: 高度，相对于椭球面 (km)
    ///   - date: 计算日期
    ///   - minDegree: 最小展开阶数，默认1
    ///   - maxDegree: 最大展开阶数，默认模型最大阶数
    /// - Returns: 地磁坐标系下的磁场分量 (Be, Bn, Bu)
    func igrf(lon: SHCAngle, lat: SHCAngle, h: Double, date: Date, minDegree: Int = 1, maxDegree: Int? = nil) -> (Be: Double, Bn: Double, Bu: Double) {
        let effectiveMaxDegree = maxDegree ?? self.degree
        let effectiveMinDegree = max(1, minDegree)
        
        if effectiveMinDegree > effectiveMaxDegree {
            // 重置为默认范围
            return igrf(lon: lon, lat: lat, h: h, date: date, minDegree: 1, maxDegree: self.degree)
        }
        
        // 转换为地心坐标系
        let (theta, r, _, _) = geod2geoc(gdLat: lat, height: h, Bn: 0, Bu: 0)
        let phi = lon
        
        // 使用igrfGC计算地心坐标系下的磁场
        let geocentricResult = igrfGC(r: r, theta: theta, phi: phi, date: date, minDegree: minDegree, maxDegree: effectiveMaxDegree)
        
        // 将地心坐标系的磁场分量转换回地磁坐标系
        let (_, _, Bn, Bu) = geoc2geod(theta: theta, r: r, B_theta: geocentricResult.Btheta, B_r: geocentricResult.Br)
        
        // Bphi对应于Be（东向分量）
        let Be = geocentricResult.Bphi
        
        return (Be: Be, Bn: Bn, Bu: Bu)
    }
}

public extension SHCModel {
    func geoc2geod(theta: SHCAngle, r: Double, B_theta: Double, B_r: Double) -> (gdLat: SHCAngle, height: Double, Bn: Double, Bu: Double) {
        let a = WGS84_a
        let b = a*sqrt(1 - WGS84_e2)
        let e2 = 1 - pow(b/a, 2)
        let e4 = e2*e2
        let e6 = e4*e2
        let e8 = e4*e4
        
        let scl = theta.sin()
        let ccl = theta.cos()
        let ri = a/r
        
        // 系数计算
        let a21 = (512*e2 + 128*e4 + 60*e6 + 35*e8)/1024.0
        let a22 = (e6 + e8)/32.0
        let a23 = -3*(4*e6 + 3*e8)/256.0
        
        let a41 = -(64*e4 + 48*e6 + 35*e8)/1024.0
        let a42 = (4*e4 + 2*e6 + e8)/16.0
        let a43 = 15*e8/256.0
        
        let a61 = 3*(4*e6 + 5*e8)/1024.0
        // let a63 = 35*(4*e6 + 3*e8)/768.0
        
        // 级数展开计算纬度修正
        let a2 = ri*(a21 + ri*(a22 + ri*a23))
        let a4 = ri*(a41 + ri*(a42 + ri*a43))
        let a6 = ri*a61
        
        let s2cl = 2*scl*ccl
        let s4cl = 2*s2cl*(2*ccl*ccl - 1)
        let s6cl = s2cl*(4*ccl*ccl - 3)
        
        let delta = s2cl*a2 + s4cl*a4 + s6cl*a6
        
        let gdLatRad = theta.radians + delta
        let gdLat = SHCAngle(radians: gdLatRad)
        
        // 高度计算
        let n = a/sqrt(1 - e2*pow(gdLat.sin(), 2))
        let height = r*cos(delta) - n
        
        // 磁场分量转换
        let psiRadians = scl*gdLat.sin() - ccl*gdLat.cos()
        let psi = SHCAngle(radians: psiRadians)
        let Bn = -psi.cos()*B_theta - psi.sin()*B_r
        let Bu = -psi.sin()*B_theta + psi.cos()*B_r
        
        return (gdLat, height, Bn, Bu)
    }
}

public extension SHCModel {
    func geod2geoc(gdLat: SHCAngle, height: Double, Bn: Double, Bu: Double) -> (theta: SHCAngle, r: Double, B_theta: Double, B_r: Double) {
        let a = WGS84_a
        let b = a * sqrt(1 - WGS84_e2)
        
        let sinAlpha = gdLat.sin()
        let cosAlpha = gdLat.cos()
        
        let tmp = height * sqrt(pow(a*cosAlpha, 2) + pow(b*sinAlpha, 2))
        let betaRadians = atan((tmp + pow(b, 2)) / (tmp + pow(a, 2)) * tan(gdLat.radians))
        let theta = SHCAngle(radians: .pi/2 - betaRadians)
        
        let r = sqrt(pow(height, 2) + 2*tmp + (pow(a, 2)*(1 - (1 - pow(b/a, 4)) * pow(sinAlpha, 2))) / (1 - (1 - pow(b/a, 2)) * pow(sinAlpha, 2)))
        
        let psiRadians = sinAlpha * sin(theta.radians) - cosAlpha * cos(theta.radians)
        let psi = SHCAngle(radians: psiRadians)
        
        let B_r = -psi.sin() * Bn + psi.cos() * Bu
        let B_theta = -psi.cos() * Bn - psi.sin() * Bu
        
        return (theta, r, B_theta, B_r)
    }
}





public extension SHCModel {
    /// 计算IGRF模型值（地心坐标系输入输出）
    /// - Parameters:
    ///   - r: 地心距离 (km)
    ///   - theta: 余纬角度 (度)
    ///   - phi: 经度角度，东向为正 (度)
    ///   - date: 计算日期
    ///   - minDegree: 最小展开阶数，默认1
    ///   - maxDegree: 最大展开阶数，默认模型最大阶数
    /// - Returns: 地心坐标系下的磁场分量
    func igrfGC(r: Double, theta: SHCAngle, phi: SHCAngle, date: Date, minDegree: Int = 1, maxDegree: Int? = nil) -> IGRFGeocentricResult {
        let effectiveMaxDegree = maxDegree ?? self.degree
        let effectiveMinDegree = max(1, minDegree)
        let effectiveMaxDegreeClamped = min(effectiveMaxDegree, self.degree)
        
        // 将日期转换为十进制年份
        let decimalYear = dateToDecimalYear(date)
        
        // 验证日期范围
        guard decimalYear >= minYear && decimalYear <= maxYear else {
            // 返回零值或抛出错误，这里选择返回零值
            return IGRFGeocentricResult(Br: 0, Btheta: 0, Bphi: 0)
        }
        
        // 准备keys数组
        var keys: [(n: Int, m: Int)] = []
        for n in effectiveMinDegree...effectiveMaxDegreeClamped {
            for m in 0...n {
                keys.append((n: n, m: m))
            }
        }
        
        // 计算Legendre函数
        let legendre = Legendre(theta: [theta.degree], keys: keys)
        
        // 获取系数并进行时间插值
        var gCoefficients: [Double] = []
        var hCoefficients: [Double] = []
        
        for key in keys {
            let n = key.n
            let m = key.m
            
            // g系数
            let gKey = SHCCoefficientKey(n: n, m: m, type: .g)
            if let gCoeff = coefficients[gKey] {
                let interpolatedValue = interpolateCoefficient(gCoeff.values, for: decimalYear)
                gCoefficients.append(interpolatedValue)
            } else {
                gCoefficients.append(0.0)
            }
            
            // h系数（m=0时h系数为0）
            if m > 0 {
                let hKey = SHCCoefficientKey(n: n, m: m, type: .h)
                if let hCoeff = coefficients[hKey] {
                    let interpolatedValue = interpolateCoefficient(hCoeff.values, for: decimalYear)
                    hCoefficients.append(interpolatedValue)
                } else {
                    hCoefficients.append(0.0)
                }
            } else {
                hCoefficients.append(0.0)
            }
        }
        
        // 计算磁场分量
        let thetaRad = theta.radians
        let phiRad = phi.radians
        
        var Br = 0.0
        var Btheta = 0.0
        var Bphi = 0.0
        
        let rRatio = RE / r
        
        for (index, key) in keys.enumerated() {
            let n = key.n
            let m = key.m
            
            let pValue = legendre.p[0][index]
            let dpValue = legendre.dp[0][index]
            
            let gCoeff = gCoefficients[index]
            let hCoeff = hCoefficients[index]
            
            // 计算cos(mφ)和sin(mφ)
            let cosMPhi = cos(Double(m) * phiRad)
            let sinMPhi = sin(Double(m) * phiRad)
            
            // 计算径向分量 Br
            let brTerm = pow(rRatio, Double(n + 2)) * Double(n + 1) * (gCoeff * cosMPhi + hCoeff * sinMPhi)
            Br += pValue * brTerm
            
            // 计算余纬分量 Btheta
            let bthetaTerm = -pow(rRatio, Double(n + 1)) * rRatio * (gCoeff * cosMPhi + hCoeff * sinMPhi)
            Btheta += dpValue * bthetaTerm
            
            // 计算经度分量 Bphi
            if m > 0 {
                let bphiTerm = -pow(rRatio, Double(n + 1)) * rRatio * Double(m) * (gCoeff * sinMPhi - hCoeff * cosMPhi)
                let sinTheta = sin(thetaRad)
                if abs(sinTheta) > 1e-10 { // 避免除以零
                    Bphi += pValue * bphiTerm / sinTheta
                }
            }
        }
        
        return IGRFGeocentricResult(Br: Br, Btheta: Btheta, Bphi: Bphi)
    }
    
    /// 对系数进行时间插值
    private func interpolateCoefficient(_ values: [Double], for year: Double) -> Double {
        guard years.count > 1 else {
            return values.first ?? 0.0
        }
        
        // 找到合适的区间进行线性插值
        let years = self.years
        if year <= years.first ?? year {
            return values.first ?? 0.0
        }
        if year >= years.last ?? year {
            return values.last ?? 0.0
        }
        
        for i in 0..<(years.count - 1) {
            if year >= years[i] && year <= years[i + 1] {
                let t = (year - years[i]) / (years[i + 1] - years[i])
                return values[i] * (1 - t) + values[i + 1] * t
            }
        }
        
        return values.last ?? 0.0
    }
}
