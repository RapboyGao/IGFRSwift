import Foundation

/// 地理坐标系到地心坐标系的转换器（遵循 WGS-84 椭球参数）
struct GeodeticToGeocentricConverter {
    /// 地心半径（单位：千米）
    let radius: Double
    /// 地心余纬度（单位：度，范围 0...180）
    let theta: Double
    /// 旋转参数（用于磁场分量转换）
    let sinDelta: Double
    /// 旋转参数（用于磁场分量转换）
    let cosDelta: Double
    
    /// 初始化转换器并进行地理坐标到地心坐标的完整计算
    /// - Parameters:
    ///   - h: 大地高度（海拔，单位：千米）
    ///   - gdColatitude: 大地余纬度（单位：度，范围 0...180）
    init(h: Double, gdColatitude: Double) {
        // WGS-84 椭球参数定义
        let eqrad = 6378.137 // 赤道半径（千米）
        let flat = 1.0 / 298.257223563 // 地球扁率
        let plrad = eqrad * (1.0 - flat) // 极半径（千米）
        
        // 将大地余纬度转换为弧度
        let gdColatRad = gdColatitude * .pi / 180.0
        
        // 计算大地余纬度的三角函数值
        let cosTheta = cos(gdColatRad) // 大地余纬余弦
        let sinTheta = sin(gdColatRad) // 大地余纬正弦
        
        // 计算椭球参数辅助量
        let aSquared = pow(eqrad, 2) // 赤道半径平方
        let bSquared = pow(plrad, 2) // 极半径平方
        
        // 计算椭球表面到地心的垂直距离
        let rho = sqrt(aSquared * pow(sinTheta, 2) + bSquared * pow(cosTheta, 2))
        
        // 计算地心半径（考虑高度影响）
        let radiusCalculated = sqrt(
            h * (h + 2 * rho) +
                (pow(aSquared, 2) * pow(sinTheta, 2) + pow(bSquared, 2) * pow(cosTheta, 2)) / pow(rho, 2)
        )
        
        // 计算旋转参数（用于磁场分量转换）
        let cosDelta = (h + rho) / radiusCalculated
        let sinDelta = (aSquared - bSquared) * cosTheta * sinTheta / (rho * radiusCalculated)
        
        // 计算地心余纬度（弧度转角度）
        let thetaRad = acos(cosTheta * cosDelta - sinTheta * sinDelta)
        let thetaDegrees = thetaRad * 180.0 / .pi
        
        // 属性赋值
        self.radius = radiusCalculated
        self.theta = thetaDegrees
        self.sinDelta = sinDelta
        self.cosDelta = cosDelta
    }
}
