import Foundation

/// 连带勒让德多项式计算器
/// 实现IGRF14规范要求的Schmidt半归一化连带勒让德多项式
/// - Parameters:
///   - n: 阶数 (degree)
///   - m: 次数 (order)
///   - θ: 地心余纬角（弧度）
struct Legendre: Codable, Sendable, Hashable {
    /// Schmidt半归一化系数计算
    /// 实现公式：S(n,m) = sqrt( (2-δ₀ᵐ) * (n-m)! / (n+m)! )
    /// - Parameters:
    ///   - n: 球谐系数阶数
    ///   - m: 球谐系数次数
    static func seminarNorm(n: Int, m: Int) -> Double {
        // δ₀ᵐ 克罗内克函数，当m=0时为1否则为2
        let kronecker = m == 0 ? 1.0 : 2.0
        let numerator = (2.0 - kronecker) * Double((1...n - m).reduce(1, *))
        let denominator = (1...n + m).reduce(1, *)
        return sqrt(Double(numerator) / Double(denominator))
    }

    let n: Int
    let m: Int
    let θ: Double
    let p: Double
    let dp: Double

    /// 初始化连带勒让德多项式计算
    /// - Parameters:
    ///   - n: 阶数 (1 ≤ n ≤ 13)
    ///   - m: 次数 (0 ≤ m ≤ n)
    ///   - θ: 地心余纬角（单位：弧度）
    init(n: Int, m: Int, θ: Double) {
        self.n = n
        self.m = m
        self.θ = θ

        let sinθ: Double = sin(θ)
        let cosθ: Double = cos(θ)

        p = pow(sinθ, Double(m)) * Self.seminarNorm(n: n, m: m)
        dp = Double(n) * cosθ * p / sinθ - Double(n + m) * p / sinθ
    }
}
