//
//  SHCModel_1.swift
//

import Foundation

extension SHCModel {
    static let model1 = SHCModel(
        version: 1,
        degree: 13,
        minYear: 1965.0,
        maxYear: 1975.0,
        years: [1965.0, 1970.0, 1975.0],
        coefficients: [
            Coefficient(n: 1, m: 0, type: .g, values: [-30339.0, -30263.0, -30186.0]),
            Coefficient(n: 1, m: 1, type: .g, values: [-2123.0, -2080.0, -2036.0]),
            Coefficient(n: 1, m: 1, type: .h, values: [5758.0, 5737.0, 5715.0]),
            Coefficient(n: 2, m: 0, type: .g, values: [-1654.0, -1632.0, -1610.0]),
            Coefficient(n: 2, m: 1, type: .g, values: [2994.0, 2993.0, 2991.0]),
            Coefficient(n: 2, m: 1, type: .h, values: [-2006.0, -1947.0, -1888.0]),
            Coefficient(n: 2, m: 2, type: .g, values: [1567.0, 1559.0, 1551.0]),
            Coefficient(n: 2, m: 2, type: .h, values: [130.0, 47.0, -37.0]),
            Coefficient(n: 3, m: 0, type: .g, values: [1297.0, 1298.0, 1299.0]),
            Coefficient(n: 3, m: 1, type: .g, values: [-2036.0, -2090.0, -2144.0]),
            Coefficient(n: 3, m: 1, type: .h, values: [-403.0, -382.0, -361.0]),
            Coefficient(n: 3, m: 2, type: .g, values: [1289.0, 1293.0, 1296.0]),
            Coefficient(n: 3, m: 2, type: .h, values: [242.0, 246.0, 249.0]),
            Coefficient(n: 3, m: 3, type: .g, values: [843.0, 824.0, 805.0]),
            Coefficient(n: 3, m: 3, type: .h, values: [-176.0, -215.0, -253.0]),
            Coefficient(n: 4, m: 0, type: .g, values: [958.0, 955.0, 951.0]),
            Coefficient(n: 4, m: 1, type: .g, values: [805.0, 806.0, 807.0]),
            Coefficient(n: 4, m: 1, type: .h, values: [149.0, 149.0, 148.0]),
            Coefficient(n: 4, m: 2, type: .g, values: [492.0, 477.0, 462.0]),
            Coefficient(n: 4, m: 2, type: .h, values: [-280.0, -272.0, -264.0]),
            Coefficient(n: 4, m: 3, type: .g, values: [-392.0, -393.0, -393.0]),
            Coefficient(n: 4, m: 3, type: .h, values: [8.0, 23.0, 37.0]),
            Coefficient(n: 4, m: 4, type: .g, values: [256.0, 246.0, 235.0]),
            Coefficient(n: 4, m: 4, type: .h, values: [-265.0, -286.0, -307.0]),
            Coefficient(n: 5, m: 0, type: .g, values: [-223.0, -214.0, -204.0]),
            Coefficient(n: 5, m: 1, type: .g, values: [357.0, 363.0, 368.0]),
            Coefficient(n: 5, m: 1, type: .h, values: [16.0, 28.0, 39.0]),
            Coefficient(n: 5, m: 2, type: .g, values: [246.0, 261.0, 275.0]),
            Coefficient(n: 5, m: 2, type: .h, values: [125.0, 134.0, 142.0]),
            Coefficient(n: 5, m: 3, type: .g, values: [-26.0, -23.0, -20.0]),
            Coefficient(n: 5, m: 3, type: .h, values: [-123.0, -135.0, -147.0]),
            Coefficient(n: 5, m: 4, type: .g, values: [-161.0, -161.0, -161.0]),
            Coefficient(n: 5, m: 4, type: .h, values: [-107.0, -103.0, -99.0]),
            Coefficient(n: 5, m: 5, type: .g, values: [-51.0, -45.0, -38.0]),
            Coefficient(n: 5, m: 5, type: .h, values: [77.0, 76.0, 74.0]),
            Coefficient(n: 6, m: 0, type: .g, values: [47.0, 47.0, 46.0]),
            Coefficient(n: 6, m: 1, type: .g, values: [60.0, 59.0, 57.0]),
            Coefficient(n: 6, m: 1, type: .h, values: [-14.0, -19.0, -23.0]),
            Coefficient(n: 6, m: 2, type: .g, values: [4.0, 10.0, 15.0]),
            Coefficient(n: 6, m: 2, type: .h, values: [106.0, 104.0, 102.0]),
            Coefficient(n: 6, m: 3, type: .g, values: [-229.0, -220.0, -210.0]),
            Coefficient(n: 6, m: 3, type: .h, values: [68.0, 78.0, 88.0]),
            Coefficient(n: 6, m: 4, type: .g, values: [3.0, 1.0, -1.0]),
            Coefficient(n: 6, m: 4, type: .h, values: [-32.0, -38.0, -43.0]),
            Coefficient(n: 6, m: 5, type: .g, values: [-4.0, -6.0, -8.0]),
            Coefficient(n: 6, m: 5, type: .h, values: [-10.0, -10.0, -9.0]),
            Coefficient(n: 6, m: 6, type: .g, values: [-112.0, -113.0, -114.0]),
            Coefficient(n: 6, m: 6, type: .h, values: [-13.0, -9.0, -4.0]),
            Coefficient(n: 7, m: 0, type: .g, values: [71.0, 69.0, 66.0]),
            Coefficient(n: 7, m: 1, type: .g, values: [-54.0, -56.0, -57.0]),
            Coefficient(n: 7, m: 1, type: .h, values: [-57.0, -63.0, -68.0]),
            Coefficient(n: 7, m: 2, type: .g, values: [0.0, -4.0, -7.0]),
            Coefficient(n: 7, m: 2, type: .h, values: [-27.0, -26.0, -24.0]),
            Coefficient(n: 7, m: 3, type: .g, values: [12.0, 10.0, 7.0]),
            Coefficient(n: 7, m: 3, type: .h, values: [-8.0, -6.0, -4.0]),
            Coefficient(n: 7, m: 4, type: .g, values: [-25.0, -24.0, -22.0]),
            Coefficient(n: 7, m: 4, type: .h, values: [9.0, 10.0, 11.0]),
            Coefficient(n: 7, m: 5, type: .g, values: [-9.0, -9.0, -9.0]),
            Coefficient(n: 7, m: 5, type: .h, values: [23.0, 25.0, 27.0]),
            Coefficient(n: 7, m: 6, type: .g, values: [13.0, 12.0, 11.0]),
            Coefficient(n: 7, m: 6, type: .h, values: [-19.0, -18.0, -17.0]),
            Coefficient(n: 7, m: 7, type: .g, values: [-2.0, -5.0, -8.0]),
            Coefficient(n: 7, m: 7, type: .h, values: [-17.0, -16.0, -14.0]),
            Coefficient(n: 8, m: 0, type: .g, values: [10.0, 11.0, 11.0]),
            Coefficient(n: 8, m: 1, type: .g, values: [9.0, 11.0, 13.0]),
            Coefficient(n: 8, m: 1, type: .h, values: [3.0, 4.0, 4.0]),
            Coefficient(n: 8, m: 2, type: .g, values: [-3.0, 0.0, 3.0]),
            Coefficient(n: 8, m: 2, type: .h, values: [-13.0, -14.0, -15.0]),
            Coefficient(n: 8, m: 3, type: .g, values: [-12.0, -12.0, -12.0]),
            Coefficient(n: 8, m: 3, type: .h, values: [5.0, 4.0, 2.0]),
            Coefficient(n: 8, m: 4, type: .g, values: [-4.0, -4.0, -4.0]),
            Coefficient(n: 8, m: 4, type: .h, values: [-17.0, -18.0, -19.0]),
            Coefficient(n: 8, m: 5, type: .g, values: [7.0, 7.0, 6.0]),
            Coefficient(n: 8, m: 5, type: .h, values: [4.0, 3.0, 1.0]),
            Coefficient(n: 8, m: 6, type: .g, values: [-5.0, -4.0, -2.0]),
            Coefficient(n: 8, m: 6, type: .h, values: [22.0, 20.0, 18.0]),
            Coefficient(n: 8, m: 7, type: .g, values: [12.0, 11.0, 9.0]),
            Coefficient(n: 8, m: 7, type: .h, values: [-3.0, -5.0, -6.0]),
            Coefficient(n: 8, m: 8, type: .g, values: [6.0, 4.0, 1.0]),
            Coefficient(n: 8, m: 8, type: .h, values: [-16.0, -18.0, -19.0]),
            Coefficient(n: 9, m: 0, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 9, m: 1, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 9, m: 1, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 9, m: 2, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 9, m: 2, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 9, m: 3, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 9, m: 3, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 9, m: 4, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 9, m: 4, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 9, m: 5, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 9, m: 5, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 9, m: 6, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 9, m: 6, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 9, m: 7, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 9, m: 7, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 9, m: 8, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 9, m: 8, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 9, m: 9, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 9, m: 9, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 10, m: 0, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 10, m: 1, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 10, m: 1, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 10, m: 2, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 10, m: 2, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 10, m: 3, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 10, m: 3, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 10, m: 4, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 10, m: 4, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 10, m: 5, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 10, m: 5, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 10, m: 6, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 10, m: 6, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 10, m: 7, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 10, m: 7, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 10, m: 8, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 10, m: 8, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 10, m: 9, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 10, m: 9, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 10, m: 10, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 10, m: 10, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 11, m: 0, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 11, m: 1, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 11, m: 1, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 11, m: 2, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 11, m: 2, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 11, m: 3, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 11, m: 3, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 11, m: 4, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 11, m: 4, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 11, m: 5, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 11, m: 5, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 11, m: 6, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 11, m: 6, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 11, m: 7, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 11, m: 7, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 11, m: 8, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 11, m: 8, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 11, m: 9, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 11, m: 9, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 11, m: 10, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 11, m: 10, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 11, m: 11, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 11, m: 11, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 0, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 1, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 1, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 2, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 2, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 3, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 3, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 4, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 4, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 5, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 5, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 6, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 6, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 7, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 7, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 8, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 8, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 9, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 9, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 10, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 10, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 11, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 11, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 12, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 12, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 0, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 1, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 1, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 2, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 2, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 3, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 3, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 4, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 4, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 5, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 5, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 6, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 6, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 7, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 7, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 8, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 8, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 9, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 9, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 10, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 10, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 11, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 11, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 12, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 12, type: .h, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 13, type: .g, values: [0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 13, type: .h, values: [0.0, 0.0, 0.0])
        ]
    )
}
