import Foundation
import Accelerate

public struct Legendre {
    public let theta: [Double]
    public let keys: [(n: Int, m: Int)]
    public let p: [[Double]]
    public let dp: [[Double]]
    
    public init(theta: [Double], keys: [(n: Int, m: Int)]) {
        self.theta = theta
        self.keys = keys
        
        // 获取最大N和最大M
        let nValues = keys.map { $0.n }
        let mValues = keys.map { $0.m }
        let nMax = nValues.max() ?? 0
        let mMax = mValues.max() ?? 0
        
        // 转换为弧度
        let thetaRad = theta.map { SHCAngle(degree: $0).radians }
        
        // 初始化存储
        var pValues: [Int: [Int: [Double]]] = [:]
        var dpValues: [Int: [Int: [Double]]] = [:]
        var sValues: [Int: [Int: Double]] = [:]
        
        // 初始化数组
        for n in 0...nMax {
            pValues[n] = [:]
            dpValues[n] = [:]
            sValues[n] = [:]
            for m in 0...min(n, mMax) {
                pValues[n]?[m] = Array(repeating: 0.0, count: theta.count)
                dpValues[n]?[m] = Array(repeating: 0.0, count: theta.count)
            }
        }
        
        // 计算sin和cos
        let sinTheta = thetaRad.map { sin($0) }
        let cosTheta = thetaRad.map { cos($0) }
        
        // 初始化Schmidt归一化系数
        sValues[0]?[0] = 1.0
        
        // 初始化函数值
        for i in 0..<theta.count {
            pValues[0]?[0]?[i] = 1.0
            dpValues[0]?[0]?[i] = 0.0
        }
        
        // 计算Legendre函数和导数
        for n in 1...nMax {
            for m in 0...min(n, mMax) {
                for i in 0..<theta.count {
                    let sinth = sinTheta[i]
                    let costh = cosTheta[i]
                    
                    if n == m {
                        // 对角线元素
                        if let prevP = pValues[n-1]?[m-1]?[i], let prevDP = dpValues[n-1]?[m-1]?[i] {
                            pValues[n]?[m]?[i] = sinth * prevP
                            dpValues[n]?[m]?[i] = sinth * prevDP + costh * prevP
                        }
                    } else {
                        if n == 1 {
                            // n=1的特殊情况
                            if let prevP = pValues[n-1]?[m]?[i], let prevDP = dpValues[n-1]?[m]?[i] {
                                pValues[n]?[m]?[i] = costh * prevP
                                dpValues[n]?[m]?[i] = costh * prevDP - sinth * prevP
                            }
                        } else if n > 1 {
                            // n>1的一般情况
                            let knm = Double((n - 1) * (n - 1) - m * m) / Double((2 * n - 1) * (2 * n - 3))
                            if let prevP = pValues[n-1]?[m]?[i], 
                               let prevDP = dpValues[n-1]?[m]?[i],
                               let prevPrevP = pValues[n-2]?[m]?[i],
                               let prevPrevDP = dpValues[n-2]?[m]?[i] {
                                
                                pValues[n]?[m]?[i] = costh * prevP - knm * prevPrevP
                                dpValues[n]?[m]?[i] = costh * prevDP - sinth * prevP - knm * prevPrevDP
                            }
                        }
                    }
                }
                
                // 计算Schmidt归一化系数
                if m == 0 {
                    if let prevS = sValues[n-1]?[0] {
                        sValues[n]?[0] = prevS * Double(2 * n - 1) / Double(n)
                    }
                } else {
                    if let prevS = sValues[n]?[m-1] {
                        let factor = Double(n - m + 1) * (m == 1 ? 2.0 : 1.0) / Double(n + m)
                        sValues[n]?[m] = prevS * sqrt(factor)
                    }
                }
            }
        }
        
        // 应用Schmidt归一化
        for n in 1...nMax {
            for m in 0...min(n, mMax) {
                if let sValue = sValues[n]?[m] {
                    for i in 0..<theta.count {
                        if let val = pValues[n]?[m]?[i] {
                            pValues[n]?[m]?[i] = val * sValue
                        }
                        if let val = dpValues[n]?[m]?[i] {
                            dpValues[n]?[m]?[i] = val * sValue
                        }
                    }
                }
            }
        }
        
        // 根据keys提取结果
        var resultP: [[Double]] = []
        var resultDP: [[Double]] = []
        
        for key in keys {
            let n = key.n
            let m = key.m
            
            if let pRow = pValues[n]?[m], let dpRow = dpValues[n]?[m] {
                resultP.append(pRow)
                resultDP.append(dpRow)
            } else {
                // 如果找不到对应的值，填充0
                resultP.append(Array(repeating: 0.0, count: theta.count))
                resultDP.append(Array(repeating: 0.0, count: theta.count))
            }
        }
        
        // 转置矩阵以匹配Python的输出格式 (theta.size × len(keys))
        self.p = (0..<theta.count).map { i in
            resultP.map { $0[i] }
        }
        
        self.dp = (0..<theta.count).map { i in
            resultDP.map { $0[i] }
        }
    }
}