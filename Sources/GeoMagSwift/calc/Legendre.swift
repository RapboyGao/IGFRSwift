import Foundation

internal enum Legendre {
    nonisolated(unsafe) private static var normalizationCache: [Int: [[Double]]] = [:]
    private static let cacheLock = NSLock()

    static func schmidtNormalized(nmax: Int, theta: Double) -> (p: [[Double]], dp: [[Double]]) {
        let sinTheta = sin(theta)
        let cosTheta = cos(theta)
        let sinThetaSafe = abs(sinTheta) < 1.0e-10 ? (sinTheta >= 0 ? 1.0e-10 : -1.0e-10) : sinTheta

        var p = Array(repeating: Array(repeating: 0.0, count: nmax + 1), count: nmax + 1)
        var dp = Array(repeating: Array(repeating: 0.0, count: nmax + 1), count: nmax + 1)

        p[0][0] = 1.0
        dp[0][0] = 0.0

        if nmax == 0 {
            return (p, dp)
        }

        for m in 1...nmax {
            p[m][m] = (2.0 * Double(m) - 1.0) * sinTheta * p[m - 1][m - 1]
        }

        for m in 0..<nmax {
            p[m + 1][m] = (2.0 * Double(m) + 1.0) * cosTheta * p[m][m]
        }

        if nmax >= 2 {
            for m in 0...nmax {
                if m + 2 > nmax { continue }
                for n in (m + 2)...nmax {
                    let nDouble = Double(n)
                    let mDouble = Double(m)
                    let numerator = (2.0 * nDouble - 1.0) * cosTheta * p[n - 1][m]
                        - (nDouble + mDouble - 1.0) * p[n - 2][m]
                    p[n][m] = numerator / (nDouble - mDouble)
                }
            }
        }

        for n in 1...nmax {
            for m in 0...n {
                let nDouble = Double(n)
                let mDouble = Double(m)
                let term = nDouble * cosTheta * p[n][m]
                let prev = (n - 1 >= m) ? (nDouble + mDouble) * p[n - 1][m] : 0.0
                dp[n][m] = (term - prev) / sinThetaSafe
            }
        }

        let normalization = normalizationFactors(nmax: nmax)
        for n in 0...nmax {
            for m in 0...n {
                let factor = normalization[n][m]
                p[n][m] *= factor
                dp[n][m] *= factor
            }
        }

        return (p, dp)
    }

    private static func normalizationFactors(nmax: Int) -> [[Double]] {
        cacheLock.lock()
        if let cached = normalizationCache[nmax] {
            cacheLock.unlock()
            return cached
        }
        cacheLock.unlock()

        let factorials = computeFactorials(upTo: 2 * nmax)
        var factors = Array(repeating: Array(repeating: 0.0, count: nmax + 1), count: nmax + 1)
        for n in 0...nmax {
            for m in 0...n {
                factors[n][m] = schmidtNormalization(n: n, m: m, factorials: factorials)
            }
        }

        cacheLock.lock()
        normalizationCache[nmax] = factors
        cacheLock.unlock()
        return factors
    }

    private static func computeFactorials(upTo max: Int) -> [Double] {
        if max <= 1 {
            return [1.0]
        }
        var factorials = Array(repeating: 1.0, count: max + 1)
        if max >= 1 {
            for i in 1...max {
                factorials[i] = factorials[i - 1] * Double(i)
            }
        }
        return factorials
    }

    private static func schmidtNormalization(n: Int, m: Int, factorials: [Double]) -> Double {
        if n == 0 && m == 0 {
            return 1.0
        }
        let delta = (m == 0) ? 1.0 : 0.0
        let numerator = 2.0 - delta
        let ratio = factorials[n - m] / factorials[n + m]
        return sqrt(numerator * ratio)
    }
}
