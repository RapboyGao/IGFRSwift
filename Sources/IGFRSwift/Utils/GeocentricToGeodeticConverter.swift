import Foundation

//
//  GeocentricToGeodeticConverter.swift
//

/// 地心坐标系到地理坐标系转换器（遵循 WGS-84 椭球参数）
struct GeocentricToGeodeticConverter {
    /// 地理高度（单位：千米）
    let height: Double
    /// 地理余纬度（单位：度，范围 0...180）
    let beta: Double
    
    /// 初始化转换器并进行地心坐标到地理坐标的完整计算
    /// - Parameters:
    ///   - radius: 地心半径（单位：千米）
    ///   - theta: 地心余纬度（单位：度，范围 0...180）
    init(radius: Double, theta: Double) {
        // WGS-84 椭球参数定义
        let eqrad = 6378.137 // 赤道半径（千米）
        let flat = 1.0 / 298.257223563 // 地球扁率
        let plrad = eqrad * (1.0 - flat) // 极半径（千米）
        
        // 将地心余纬度转换为弧度
        let thetaRad = theta * .pi / 180.0
        
        // 计算地心坐标系下的圆柱坐标分量
        let r = radius * sin(thetaRad) // 水平投影半径
        let z = radius * cos(thetaRad) // 垂直投影高度
        
        // 预计算平方值提升性能
        let r2 = pow(r, 2)
        let z2 = pow(z, 2)
        let a2 = pow(eqrad, 2)
        let b2 = pow(plrad, 2)
        
        // 计算中间变量（根据 Zhu 1994 论文公式）
        let e2 = (a2 - b2) / a2 // 第一偏心率平方
        let e4 = pow(e2, 2) // 四次方计算
        let ep2 = (a2 - b2) / b2 // 第二偏心率平方
        
        // 迭代计算参数（式 6a-6d）
        let F = 54 * b2 * z2
        let G = r2 + (1 - e2) * z2 - e2 * (a2 - b2)
        let c = e4 * F * r2 / pow(G, 3)
        let s = pow(1 + c + sqrt(pow(c, 2) + 2 * c), 1 / 3)
        
        // 计算投影参数（式 7-8）
        let P = F / (3 * pow(s + 1 / s + 1, 2) * pow(G, 2))
        let Q = sqrt(1 + 2 * e4 * P)
        
        // 计算中间半径（式 9）
        let r0 = -P * e2 * r / (1 + Q) + sqrt(
            0.5 * a2 * (1 + 1 / Q) -
                P * (1 - e2) * z2 / (Q * (1 + Q)) -
                0.5 * P * r2
        )
        
        // 计算最终参数（式 10-11）
        let U = sqrt(pow(r - e2 * r0, 2) + z2)
        let V = sqrt(pow(r - e2 * r0, 2) + (1 - e2) * z2)
        
        // 计算地理高度（式 12）
        let z0 = b2 * z / (a2 * V)
        let heightCalculated = U * (1 - b2 / (a2 * V))
        
        // 计算地理余纬度（式 13，转换为角度）
        let betaRad = atan2(z + ep2 * z0, r)
        let betaDegrees = 90 - betaRad * 180 / .pi // 转换为地理纬度
        
        // 属性赋值
        self.height = heightCalculated
        self.beta = betaDegrees
    }
}
