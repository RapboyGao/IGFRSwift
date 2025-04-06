//
//  SchmidtLegendrePolynomial.swift
//  IGFRSwift

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
    
    /// 初始化计算Legendre多项式
    /// - Parameters:
    ///   - nmax: 最大球谐度数
    ///   - theta: 地理余纬度数组（角度制，范围0...180）
    init(nmax: Int, theta: [Double]) {
        let thetaRadians = theta.map { $0 * .pi / 180.0 } // 角度转弧度
        
        // 预计算cosθ和sinθ
        let cosTheta = thetaRadians.map { cos($0) }
        let sinTheta = thetaRadians.map { sin($0) }
        
        // 初始化三维数组（使用ContiguousArray优化内存布局）
        var pnm = [[[Double]]](repeating:
            [[Double]](repeating:
                [Double](repeating: 0.0, count: theta.count),
                count: nmax+2),
            count: nmax+1)
        
        // 设置初始值 P(0,0) = 1
        pnm[0][0] = [Double](repeating: 1.0, count: theta.count)
        
        // 计算P(1,1) = sinθ
        pnm[1][1] = sinTheta
        
        // 预计算平方根序列（优化递归计算）
        var rootn = [Double](repeating: 0.0, count: 2 * nmax * nmax+1)
        for i in 0..<rootn.count {
            rootn[i] = sqrt(Double(i))
        }
        
        // 主递归计算（优化为向量化操作）
        for m in 0..<nmax {
            // 计算P(m+1,m)项
            var pm = [Double](repeating: 0.0, count: theta.count)
            vDSP.multiply(rootn[m+m+1], pnm[m][m], result: &pm)
            vDSP.multiply(cosTheta, pm, result: &pnm[m+1][m])
            
            if m > 0 {
                // 计算P(m+1,m+1)项
                var pmPlus = [Double](repeating: 0.0, count: theta.count)
                vDSP.multiply(sinTheta, pm, result: &pmPlus)
                vDSP.divide(pmPlus, rootn[m+m+2], result: &pnm[m+1][m+1])
            }
            
            // 计算高阶项
            for n in (m+2)...nmax {
                let d = n * n - m * m
                let e = 2 * n - 1
                var term1 = [Double](repeating: 0.0, count: theta.count)
                var term2 = [Double](repeating: 0.0, count: theta.count)
                
                vDSP.multiply(Double(e), cosTheta, result: &term1)
                vDSP.multiply(term1, pnm[n - 1][m], result: &term1)
                
                vDSP.multiply(rootn[d - e], pnm[n - 2][m], result: &term2)
                
                var numerator = [Double](repeating: 0.0, count: theta.count)
                vDSP.subtract(term1, term2, result: &numerator)
                vDSP.divide(numerator, rootn[d], result: &pnm[n][m])
            }
        }
        
        // 计算导数项（优化为向量化操作）
        pnm[0][2] = pnm[1][1].map { -$0 }
        pnm[1][2] = pnm[1][0]
        
        for n in 2...nmax {
            // 计算dP(n,0)
            let sqrtTerm = sqrt(Double(n * n+n) / 2)
            pnm[0][n+1] = pnm[n][1].map { -sqrtTerm * $0 }
            
            // 计算dP(n,1)
            let term1 = pnm[n][0].map { sqrt(2 * Double(n * n+n)) * $0 }
            let term2 = pnm[n][2].map { sqrt(Double(n * n+n - 2)) * $0 }
            pnm[1][n+1] = zip(term1, term2).map { ($0 - $1) / 2 }
            
            // 计算高阶导数
            for m in 2..<n {
                let sqrt1 = sqrt(Double((n+m) * (n - m+1)))
                let sqrt2 = sqrt(Double((n+m+1) * (n - m)))
                pnm[m][n+1] = zip(pnm[n][m - 1], pnm[n][m+1]).map {
                    0.5 * (sqrt1 * $0 - sqrt2 * $1)
                }
            }
            
            // 计算dP(n,n)
            let sqrtTermN = sqrt(Double(2 * n))
            pnm[n][n+1] = pnm[n][n - 1].map { sqrtTermN * $0 / 2 }
        }
        
        self.pnm = pnm
    }
}
