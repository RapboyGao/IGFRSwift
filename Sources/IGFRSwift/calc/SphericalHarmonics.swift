import Foundation

internal enum SphericalHarmonics {
    static let referenceRadius = 6371.2

    static func fieldComponents(
        nmax: Int,
        g: [[Double]],
        h: [[Double]],
        latitude: Double,
        longitude: Double,
        altitude: Double
    ) -> (north: Double, east: Double, down: Double) {
        let coords = Geodesy.geocentricCoordinates(latitude: latitude, longitude: longitude, altitude: altitude)
        let lonRad = longitude.degreesToRadians

        let cosLon = cos(lonRad)
        let sinLon = sin(lonRad)

        var cosMLon = Array(repeating: 0.0, count: nmax + 1)
        var sinMLon = Array(repeating: 0.0, count: nmax + 1)
        cosMLon[0] = 1.0
        sinMLon[0] = 0.0
        if nmax >= 1 {
            cosMLon[1] = cosLon
            sinMLon[1] = sinLon
            if nmax > 1 {
                for m in 2...nmax {
                    cosMLon[m] = cosMLon[m - 1] * cosLon - sinMLon[m - 1] * sinLon
                    sinMLon[m] = sinMLon[m - 1] * cosLon + cosMLon[m - 1] * sinLon
                }
            }
        }

        let (p, dp) = Legendre.schmidtNormalized(nmax: nmax, theta: coords.theta)

        var br = 0.0
        var bt = 0.0
        var bp = 0.0

        let a = referenceRadius
        let r = coords.radius
        let ar = a / r
        for n in 1...nmax {
            let nDouble = Double(n)
            let arn = pow(ar, nDouble + 2.0)
            for m in 0...n {
                let mDouble = Double(m)
                let gnm = g[n][m]
                let hnm = h[n][m]
                let cosTerm = cosMLon[m]
                let sinTerm = sinMLon[m]
                let temp = gnm * cosTerm + hnm * sinTerm

                br += (nDouble + 1.0) * arn * temp * p[n][m]
                bt += arn * temp * dp[n][m]

                if m > 0 {
                    let tempPhi = gnm * sinTerm - hnm * cosTerm
                    bp += arn * mDouble * tempPhi * p[n][m]
                }
            }
        }

        br = -br
        bt = -bt
        let sinTheta = coords.sinTheta
        let sinThetaSafe = abs(sinTheta) < 1.0e-10 ? (sinTheta >= 0 ? 1.0e-10 : -1.0e-10) : sinTheta
        bp = bp / sinThetaSafe

        let x = -bt * coords.cosDelta - br * coords.sinDelta
        let z = bt * coords.sinDelta - br * coords.cosDelta
        let y = bp

        return (north: x, east: y, down: z)
    }
}
