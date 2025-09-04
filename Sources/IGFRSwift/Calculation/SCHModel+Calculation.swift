import Foundation

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
