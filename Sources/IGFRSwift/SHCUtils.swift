import Foundation

/// https://en.wikipedia.org/wiki/International_Geomagnetic_Reference_Field
public enum SHCUtils: Sendable, Hashable {
    /// 计算Schmidt准归一化系数（优化版）
    /// - Parameters:
    ///   - n: 球谐函数的阶数，非负整数
    ///   - m: 球谐函数的次数，0 ≤ m ≤ n
    /// - Returns: 归一化系数值，非法输入时返回0
    static func schmidtQuasiNormalizedCoefficient(n: Int, m: Int) -> Double {
        // 输入有效性检查
        // 根据数学定义，m必须满足 0 ≤ m ≤ n
        guard m >= 0 && m <= n else {
            return 0.0 // 返回0表示非法输入
        }
        
        // 情况1：m=0时的简化公式
        // 数学公式：Kₙ = 1/(2ⁿ)
        if m == 0 {
            // 性能优化：使用exp2代替pow(2, n)
            // 数学等价性：2ⁿ = e^(ln2 * n) → exp2(n) = 2ⁿ
            return 1.0 / exp2(Double(n))
        }
        // 情况2：m>0时的通用公式
        // 数学公式：Kₙ = 1/(2ⁿ) * sqrt(2 * (n-m)! / (n+m)!))
        else {
            // 计算连乘范围的上下限
            // 数学等价转换：(n+m)!/(n-m)! = ∏_{k=n-m+1}^{n+m} k
            let lower = n - m + 1 // 连乘下限
            let upper = n + m // 连乘上限
            
            // 对数转换优化（核心优化点）
            // 原理：log(a*b) = loga + logb → 将连乘转换为对数求和
            // 优势：避免直接计算大数阶乘导致的数值溢出
            let logProduct = (lower ... upper).reduce(0.0) {
                // 累加每个数的自然对数
                // 注意：这里使用Double($1)防止整型溢出
                $0 + log(Double($1))
            }
            
            /* 数学推导过程：
             原式 = sqrt(2 * (n-m)! / (n+m)!)
                  = sqrt(2 / ∏_{k=n-m+1}^{n+m} k )
                  = sqrt(2) / sqrt(∏_{k=n-m+1}^{n+m} k )
                 
             转换为对数形式：
                 log(∏k) = Σlog(k)
                 sqrt(2)/sqrt(∏k) = sqrt(2) * exp(-Σlog(k)/2)
             */
            
            // 合并计算结果
            let exponent = -logProduct / 2.0
            return exp2(-Double(n)) * sqrt(2 * exp(logProduct))
            /* 分步解释：
             1. exp2(-Double(n)) → 对应 1/(2ⁿ)
             2. exp(logProduct) → 还原连乘结果 ∏k
             3. sqrt(2 * ∏k) → 根据公式计算中间项
             4. 最终结果 = (1/2ⁿ) * sqrt(2 * ∏k)
             */
        }
    }
}
