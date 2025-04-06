import Foundation

/// 球谐系数类型枚举
public enum SHCCoefficientType: String, Codable, Hashable, Sendable {
    /// 高斯系数中的余弦项（Schmidt半归一化）
    case g
    /// 高斯系数中的正弦项（Schmidt半归一化）
    case h
}
