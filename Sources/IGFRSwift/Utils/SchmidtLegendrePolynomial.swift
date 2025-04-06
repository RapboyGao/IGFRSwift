import Accelerate

/// 计算Schmidt准归一化关联Legendre多项式及其导数的结构体
///
/// 该结构体根据给定的最大度数nmax和角度theta，预先计算并存储关联Legendre多项式值及其导数
/// 结果存储在三维数组pnm中，维度为[nmax+1, nmax+2, theta.count]
///
/// - 算法说明: 实现基于Langel的递归关系公式，支持高效计算高次多项式
/// - 性能优化: 使用Accelerate框架进行向量化计算，优化三角函数和平方根运算
@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
struct SchmidtLegendrePolynomial {
    /// 存储多项式和导数的三维数组
    /// - 第一维: 阶数n (0...nmax)
    /// - 第二维: 导数标识和次数m (0...nmax+1)
    /// - 第三维: theta值的索引
    let pnm: [[[Double]]]
    
    enum SchmidtLegendreError: Error {
        case invalidNmax
        case emptyTheta
        case invalidThetaValue(Double)
    }
    
    /// 初始化计算Legendre多项式
    /// - Parameters:
    ///   - nmax: 最大球谐度数 (必须 ≥ 0)
    ///   - theta: 地理余纬度数组（角度制，范围0...180）
    init(nmax: Int, theta: [Double]) throws {
        // 参数校验
        guard nmax >= 0 else {
            throw SchmidtLegendreError.invalidNmax
        }
        guard !theta.isEmpty else {
            throw SchmidtLegendreError.emptyTheta
        }
        for angle in theta {
            guard (0...180).contains(angle) else {
                throw SchmidtLegendreError.invalidThetaValue(angle)
            }
        }
        
        let thetaRadians = theta.map { $0 * .pi / 180.0 }
        let cosTheta = thetaRadians.map { cos($0) }
        let sinTheta = thetaRadians.map { sin($0) }
        
        // 初始化三维数组，维度 [nmax+1][nmax+2][theta.count]
        var pnm = (0...nmax).map { n in
            (0...nmax+1).map { m in
                [Double](repeating: 0.0, count: theta.count)
            }
        }
        
        // 初始化 P(0,0) = 1
        pnm[0][0] = [Double](repeating: 1.0, count: theta.count)
        
        // 当nmax ≥ 1时计算初始项
        if nmax >= 1 {
            pnm[1][1] = sinTheta // P(1,1) = sinθ
        }
        
        // 预计算平方根表
        var rootn = [Double](repeating: 0.0, count: 2 * nmax * nmax + 2)
        for i in 0..<rootn.count {
            rootn[i] = sqrt(Double(i))
        }
        
        // 主递归计算
        for m in 0..<nmax {
            // 计算 P(m+1,m)
            if m+1 <= nmax {
                var pm = [Double](repeating: 0.0, count: theta.count)
                let factor = rootn[2*m+1]
                vDSP.multiply(factor, pnm[m][m], result: &pm)
                vDSP.multiply(cosTheta, pm, result: &pnm[m+1][m])
            }
            
            // 计算 P(m+1,m+1)
            if m+1 <= nmax && m+1 <= nmax {
                var pmPlus = [Double](repeating: 0.0, count: theta.count)
                vDSP.multiply(sinTheta, pnm[m][m], result: &pmPlus)
                vDSP.divide(pmPlus, rootn[2*m+2], result: &pnm[m+1][m+1])
            }
            
            // 计算高阶项 P(n,m)
            guard m+2 < nmax else {
                throw SchmidtLegendreError.invalidNmax
            }
            for n in (m+2)...nmax {
                let d = n*n - m*m
                let e = 2*n - 1
                
                var term1 = [Double](repeating: 0.0, count: theta.count)
                var term2 = [Double](repeating: 0.0, count: theta.count)
                
                // term1 = (2n-1) * cosθ * P(n-1,m)
                vDSP.multiply(Double(e), cosTheta, result: &term1)
                vDSP.multiply(term1, pnm[n-1][m], result: &term1)
                
                // term2 = sqrt((n-1)^2 - m^2) * P(n-2,m)
                vDSP.multiply(rootn[(n-1)*(n-1) - m*m], pnm[n-2][m], result: &term2)
                
                // P(n,m) = (term1 - term2)/sqrt(n² - m²)
                var numerator = [Double](repeating: 0.0, count: theta.count)
                vDSP.subtract(term1, term2, result: &numerator)
                vDSP.divide(numerator, rootn[d], result: &pnm[n][m])
            }
        }
        
        // 导数计算 (仅当nmax ≥ 1时执行)
        if nmax >= 1 {
            // dP(0,0) = -P(1,1)
            pnm[0][nmax+1] = pnm[1][1].map { -$0 }
            
            // dP(1,0) = P(1,0)
            pnm[1][nmax+1] = pnm[1][0]
        }
        
        // 高阶导数计算
        for n in 2...nmax {
            // dP(n,0) = -sqrt(n(n+1)/2) * P(n,1)
            let sqrtTerm = sqrt(Double(n*(n+1))/2.0)
            pnm[0][n+1] = pnm[n][1].map { -sqrtTerm * $0 }
            
            // dP(n,1) = [sqrt(2n(n+1)) P(n,0) - sqrt((n+2)(n-1)) P(n,2)] / 2
            let term1 = pnm[n][0].map { sqrt(2.0 * Double(n*(n+1))) * $0 }
            let term2 = pnm[n][2].map { sqrt(Double((n+2)*(n-1))) * $0 }
            pnm[1][n+1] = zip(term1, term2).map { ($0 - $1)/2.0 }
            
            // dP(n,m) for 2 ≤ m < n
            for m in 2..<n {
                let sqrt1 = sqrt(Double((n+m)*(n-m+1)))
                let sqrt2 = sqrt(Double((n+m+1)*(n-m)))
                pnm[m][n+1] = zip(pnm[n][m-1], pnm[n][m+1]).map {
                    0.5 * (sqrt1 * $0 - sqrt2 * $1)
                }
            }
            
            // dP(n,n) = sqrt(2n) * P(n,n-1) / 2
            if n >= 1 {
                let sqrtTermN = sqrt(Double(2*n))
                pnm[n][n+1] = pnm[n][n-1].map { sqrtTermN * $0 / 2.0 }
            }
        }
        
        self.pnm = pnm
    }
}
