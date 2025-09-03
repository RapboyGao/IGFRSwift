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
    static func schmidtNorm(n: Int, m: Int) -> Double {
        guard n >= 0 && m >= 0 && n >= m else { return 0.0 }
        
        // δ₀ᵐ 克罗内克函数，当m=0时为1否则为2
        let kronecker = m == 0 ? 1.0 : 2.0
        
        // 计算阶乘比值 (n-m)!/(n+m)!
        var factorialRatio: Double = 1.0
        for k in (n - m + 1)...(n + m) {
            factorialRatio /= Double(k)
        }
        
        return sqrt(kronecker * factorialRatio)
    }
    
    /// 计算阶乘
    private static func factorial(_ n: Int) -> Double {
        return (1...n).reduce(1.0) { $0 * Double($1) }
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
        
        // 使用递推关系计算连带勒让德多项式
        let (polynomial, derivative) = Self.calculateLegendre(n: n, m: m, θ: θ)
        self.p = polynomial
        self.dp = derivative
    }
    
    /// 使用递推关系计算连带勒让德多项式及其导数
    private static func calculateLegendre(n: Int, m: Int, θ: Double) -> (Double, Double) {
        guard n >= 0 && m >= 0 && n >= m else { return (0.0, 0.0) }
        
        let sinθ = sin(θ)
        let cosθ = cos(θ)
        
        // 处理sinθ接近0的情况
        if abs(sinθ) < 1e-12 {
            if m == 0 {
                // 当m=0且sinθ=0时，Pn(cosθ) = cos^n(θ)
                let p = pow(cosθ, Double(n))
                let dp = n > 0 ? Double(n) * pow(cosθ, Double(n - 1)) * (-sinθ) : 0.0
                return (p, dp)
            } else {
                // 当m>0且sinθ=0时，Pm_n(θ) = 0
                return (0.0, 0.0)
            }
        }
        
        // 计算未归一化的连带勒让德多项式
        let (unnormalizedP, unnormalizedDP) = Self.unnormalizedLegendre(n: n, m: m, cosθ: cosθ)
        
        // 应用Schmidt归一化
        let norm = schmidtNorm(n: n, m: m)
        let normalizedP = unnormalizedP * norm
        let normalizedDP = unnormalizedDP * norm
        
        return (normalizedP, normalizedDP)
    }
    
    /// 计算未归一化的连带勒让德多项式
    private static func unnormalizedLegendre(n: Int, m: Int, cosθ: Double) -> (Double, Double) {
        if m > n {
            return (0.0, 0.0)
        }
        
        if n == 0 {
            return (1.0, 0.0)
        }
        
        if n == 1 {
            if m == 0 {
                return (cosθ, 1.0)
            } else if m == 1 {
                return (1.0, 0.0) // sinθ的导数
            }
        }
        
        // 使用递推关系计算
        var pnm: [[Double]] = Array(repeating: Array(repeating: 0.0, count: n + 2), count: n + 2)
        
        // 初始化基础情况
        pnm[0][0] = 1.0
        if n >= 1 {
            pnm[1][0] = cosθ
            pnm[1][1] = 1.0 // 这是sinθ，但我们用递推计算
        }
        
        // 递推计算
        for l in 2...n {
            pnm[l][0] = ((2 * l - 1) * cosθ * pnm[l-1][0] - (l - 1) * pnm[l-2][0]) / Double(l)
            for k in 1...l {
                if k == l {
                    pnm[l][l] = (2 * l - 1) * sqrt(1 - cosθ * cosθ) * pnm[l-1][l-1]
                } else {
                    pnm[l][k] = (2 * l - 1) * cosθ * pnm[l-1][k] - (l + k - 1) * pnm[l-2][k]
                    pnm[l][k] /= Double(l - k)
                }
            }
        }
        
        let p = pnm[n][m]
        
        // 计算导数
        let dp: Double
        if m == 0 {
            dp = Double(n) * (cosθ * pnm[n][0] - pnm[n-1][0]) / (cosθ * cosθ - 1)
        } else {
            dp = Double(n + m) * pnm[n-1][m-1] - Double(m) * cosθ * pnm[n][m] / (cosθ * cosθ - 1)
        }
        
        return (p, dp)
    }
