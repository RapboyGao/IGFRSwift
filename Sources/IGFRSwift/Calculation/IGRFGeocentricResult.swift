import Foundation

/// IGRF计算结果结构体
public struct IGRFGeocentricResult {
    /// 径向磁场分量 (nT)
    public let Br: Double
    /// 余纬方向磁场分量 (nT)
    public let Btheta: Double
    /// 经度方向磁场分量 (nT)
    public let Bphi: Double
    
    
    public init(Br: Double, Btheta: Double, Bphi: Double) {
        self.Br = Br
        self.Btheta = Btheta
        self.Bphi = Bphi
    }
}
