import Foundation

public extension SHCModel {
    static let wmm2020 = SHCModel(
        fileName: "WMM.COF",
        headers: [
            "2020.0            WMM-2020        12/10/2019",
        ],
        headerNumbers: [],
        epochs:         [
            2020, 2025
        ],
        coefficients: [
            Coefficient(
                n: 1,
                m: 0,
                kind: .g,
                values:                 [
                    -29404.5, -29371
                ]
            ),
            Coefficient(
                n: 1,
                m: 0,
                kind: .h,
                values:                 [
                    0, 0
                ]
            ),
            Coefficient(
                n: 1,
                m: 1,
                kind: .g,
                values:                 [
                    -1450.7, -1412.2
                ]
            ),
            Coefficient(
                n: 1,
                m: 1,
                kind: .h,
                values:                 [
                    4652.9, 4527.4
                ]
            ),
            Coefficient(
                n: 2,
                m: 0,
                kind: .g,
                values:                 [
                    -2500, -2557.5
                ]
            ),
            Coefficient(
                n: 2,
                m: 0,
                kind: .h,
                values:                 [
                    0, 0
                ]
            ),
            Coefficient(
                n: 2,
                m: 1,
                kind: .g,
                values:                 [
                    2982, 2946.5
                ]
            ),
            Coefficient(
                n: 2,
                m: 1,
                kind: .h,
                values:                 [
                    -2991.6, -3142.6
                ]
            ),
            Coefficient(
                n: 2,
                m: 2,
                kind: .g,
                values:                 [
                    1676.8, 1665.8
                ]
            ),
            Coefficient(
                n: 2,
                m: 2,
                kind: .h,
                values:                 [
                    -734.8, -854.3
                ]
            ),
            Coefficient(
                n: 3,
                m: 0,
                kind: .g,
                values:                 [
                    1363.9, 1377.9
                ]
            ),
            Coefficient(
                n: 3,
                m: 0,
                kind: .h,
                values:                 [
                    0, 0
                ]
            ),
            Coefficient(
                n: 3,
                m: 1,
                kind: .g,
                values:                 [
                    -2381, -2412
                ]
            ),
            Coefficient(
                n: 3,
                m: 1,
                kind: .h,
                values:                 [
                    -82.2, -53.7
                ]
            ),
            Coefficient(
                n: 3,
                m: 2,
                kind: .g,
                values:                 [
                    1236.2, 1253.2
                ]
            ),
            Coefficient(
                n: 3,
                m: 2,
                kind: .h,
                values:                 [
                    241.8, 236.8
                ]
            ),
            Coefficient(
                n: 3,
                m: 3,
                kind: .g,
                values:                 [
                    525.7, 464.7
                ]
            ),
            Coefficient(
                n: 3,
                m: 3,
                kind: .h,
                values:                 [
                    -542.9, -537.4
                ]
            ),
            Coefficient(
                n: 4,
                m: 0,
                kind: .g,
                values:                 [
                    903.1, 897.6
                ]
            ),
            Coefficient(
                n: 4,
                m: 0,
                kind: .h,
                values:                 [
                    0, 0
                ]
            ),
            Coefficient(
                n: 4,
                m: 1,
                kind: .g,
                values:                 [
                    809.4, 801.4
                ]
            ),
            Coefficient(
                n: 4,
                m: 1,
                kind: .h,
                values:                 [
                    282, 283
                ]
            ),
            Coefficient(
                n: 4,
                m: 2,
                kind: .g,
                values:                 [
                    86.2, 56.2
                ]
            ),
            Coefficient(
                n: 4,
                m: 2,
                kind: .h,
                values:                 [
                    -158.4, -123.9
                ]
            ),
            Coefficient(
                n: 4,
                m: 3,
                kind: .g,
                values:                 [
                    -309.4, -282.4
                ]
            ),
            Coefficient(
                n: 4,
                m: 3,
                kind: .h,
                values:                 [
                    199.8, 218.3
                ]
            ),
            Coefficient(
                n: 4,
                m: 4,
                kind: .g,
                values:                 [
                    47.9, 20.4
                ]
            ),
            Coefficient(
                n: 4,
                m: 4,
                kind: .h,
                values:                 [
                    -350.1, -378.1
                ]
            ),
            Coefficient(
                n: 5,
                m: 0,
                kind: .g,
                values:                 [
                    -234.4, -235.9
                ]
            ),
            Coefficient(
                n: 5,
                m: 0,
                kind: .h,
                values:                 [
                    0, 0
                ]
            ),
            Coefficient(
                n: 5,
                m: 1,
                kind: .g,
                values:                 [
                    363.1, 366.1
                ]
            ),
            Coefficient(
                n: 5,
                m: 1,
                kind: .h,
                values:                 [
                    47.7, 48.2
                ]
            ),
            Coefficient(
                n: 5,
                m: 2,
                kind: .g,
                values:                 [
                    187.8, 184.3
                ]
            ),
            Coefficient(
                n: 5,
                m: 2,
                kind: .h,
                values:                 [
                    208.4, 220.9
                ]
            ),
            Coefficient(
                n: 5,
                m: 3,
                kind: .g,
                values:                 [
                    -140.7, -140.2
                ]
            ),
            Coefficient(
                n: 5,
                m: 3,
                kind: .h,
                values:                 [
                    -121.3, -125.8
                ]
            ),
            Coefficient(
                n: 5,
                m: 4,
                kind: .g,
                values:                 [
                    -151.2, -145.2
                ]
            ),
            Coefficient(
                n: 5,
                m: 4,
                kind: .h,
                values:                 [
                    32.2, 47.2
                ]
            ),
            Coefficient(
                n: 5,
                m: 5,
                kind: .g,
                values:                 [
                    13.7, 18.7
                ]
            ),
            Coefficient(
                n: 5,
                m: 5,
                kind: .h,
                values:                 [
                    99.1, 101.6
                ]
            ),
            Coefficient(
                n: 6,
                m: 0,
                kind: .g,
                values:                 [
                    65.9, 62.9
                ]
            ),
            Coefficient(
                n: 6,
                m: 0,
                kind: .h,
                values:                 [
                    0, 0
                ]
            ),
            Coefficient(
                n: 6,
                m: 1,
                kind: .g,
                values:                 [
                    65.6, 63.6
                ]
            ),
            Coefficient(
                n: 6,
                m: 1,
                kind: .h,
                values:                 [
                    -19.1, -18.6
                ]
            ),
            Coefficient(
                n: 6,
                m: 2,
                kind: .g,
                values:                 [
                    73, 75.5
                ]
            ),
            Coefficient(
                n: 6,
                m: 2,
                kind: .h,
                values:                 [
                    25, 16
                ]
            ),
            Coefficient(
                n: 6,
                m: 3,
                kind: .g,
                values:                 [
                    -121.5, -114.5
                ]
            ),
            Coefficient(
                n: 6,
                m: 3,
                kind: .h,
                values:                 [
                    52.7, 45.7
                ]
            ),
            Coefficient(
                n: 6,
                m: 4,
                kind: .g,
                values:                 [
                    -36.2, -43.2
                ]
            ),
            Coefficient(
                n: 6,
                m: 4,
                kind: .h,
                values:                 [
                    -64.4, -59.9
                ]
            ),
            Coefficient(
                n: 6,
                m: 5,
                kind: .g,
                values:                 [
                    13.5, 13.5
                ]
            ),
            Coefficient(
                n: 6,
                m: 5,
                kind: .h,
                values:                 [
                    9, 9.5
                ]
            ),
            Coefficient(
                n: 6,
                m: 6,
                kind: .g,
                values:                 [
                    -64.7, -60.7
                ]
            ),
            Coefficient(
                n: 6,
                m: 6,
                kind: .h,
                values:                 [
                    68.1, 73.1
                ]
            ),
            Coefficient(
                n: 7,
                m: 0,
                kind: .g,
                values:                 [
                    80.6, 80.1
                ]
            ),
            Coefficient(
                n: 7,
                m: 0,
                kind: .h,
                values:                 [
                    0, 0
                ]
            ),
            Coefficient(
                n: 7,
                m: 1,
                kind: .g,
                values:                 [
                    -76.8, -78.3
                ]
            ),
            Coefficient(
                n: 7,
                m: 1,
                kind: .h,
                values:                 [
                    -51.4, -48.9
                ]
            ),
            Coefficient(
                n: 7,
                m: 2,
                kind: .g,
                values:                 [
                    -8.3, -8.8
                ]
            ),
            Coefficient(
                n: 7,
                m: 2,
                kind: .h,
                values:                 [
                    -16.8, -13.8
                ]
            ),
            Coefficient(
                n: 7,
                m: 3,
                kind: .g,
                values:                 [
                    56.5, 60
                ]
            ),
            Coefficient(
                n: 7,
                m: 3,
                kind: .h,
                values:                 [
                    2.3, -1.2
                ]
            ),
            Coefficient(
                n: 7,
                m: 4,
                kind: .g,
                values:                 [
                    15.8, 16.8
                ]
            ),
            Coefficient(
                n: 7,
                m: 4,
                kind: .h,
                values:                 [
                    23.5, 22.5
                ]
            ),
            Coefficient(
                n: 7,
                m: 5,
                kind: .g,
                values:                 [
                    6.4, 3.9
                ]
            ),
            Coefficient(
                n: 7,
                m: 5,
                kind: .h,
                values:                 [
                    -2.2, -8.2
                ]
            ),
            Coefficient(
                n: 7,
                m: 6,
                kind: .g,
                values:                 [
                    -7.2, -11.2
                ]
            ),
            Coefficient(
                n: 7,
                m: 6,
                kind: .h,
                values:                 [
                    -27.2, -26.2
                ]
            ),
            Coefficient(
                n: 7,
                m: 7,
                kind: .g,
                values:                 [
                    9.8, 14.8
                ]
            ),
            Coefficient(
                n: 7,
                m: 7,
                kind: .h,
                values:                 [
                    -1.9, -0.4
                ]
            ),
            Coefficient(
                n: 8,
                m: 0,
                kind: .g,
                values:                 [
                    23.6, 23.1
                ]
            ),
            Coefficient(
                n: 8,
                m: 0,
                kind: .h,
                values:                 [
                    0, 0
                ]
            ),
            Coefficient(
                n: 8,
                m: 1,
                kind: .g,
                values:                 [
                    9.8, 10.3
                ]
            ),
            Coefficient(
                n: 8,
                m: 1,
                kind: .h,
                values:                 [
                    8.4, 6.9
                ]
            ),
            Coefficient(
                n: 8,
                m: 2,
                kind: .g,
                values:                 [
                    -17.5, -18
                ]
            ),
            Coefficient(
                n: 8,
                m: 2,
                kind: .h,
                values:                 [
                    -15.3, -11.8
                ]
            ),
            Coefficient(
                n: 8,
                m: 3,
                kind: .g,
                values:                 [
                    -0.4, 2.1
                ]
            ),
            Coefficient(
                n: 8,
                m: 3,
                kind: .h,
                values:                 [
                    12.8, 11.8
                ]
            ),
            Coefficient(
                n: 8,
                m: 4,
                kind: .g,
                values:                 [
                    -21.1, -21.6
                ]
            ),
            Coefficient(
                n: 8,
                m: 4,
                kind: .h,
                values:                 [
                    -11.8, -9.3
                ]
            ),
            Coefficient(
                n: 8,
                m: 5,
                kind: .g,
                values:                 [
                    15.3, 17.3
                ]
            ),
            Coefficient(
                n: 8,
                m: 5,
                kind: .h,
                values:                 [
                    14.9, 13.4
                ]
            ),
            Coefficient(
                n: 8,
                m: 6,
                kind: .g,
                values:                 [
                    13.7, 16.2
                ]
            ),
            Coefficient(
                n: 8,
                m: 6,
                kind: .h,
                values:                 [
                    3.6, 1.1
                ]
            ),
            Coefficient(
                n: 8,
                m: 7,
                kind: .g,
                values:                 [
                    -16.5, -16.5
                ]
            ),
            Coefficient(
                n: 8,
                m: 7,
                kind: .h,
                values:                 [
                    -6.9, -4.9
                ]
            ),
            Coefficient(
                n: 8,
                m: 8,
                kind: .g,
                values:                 [
                    -0.3, 1.7
                ]
            ),
            Coefficient(
                n: 8,
                m: 8,
                kind: .h,
                values:                 [
                    2.8, 3.3
                ]
            ),
            Coefficient(
                n: 9,
                m: 0,
                kind: .g,
                values:                 [
                    5, 4.5
                ]
            ),
            Coefficient(
                n: 9,
                m: 0,
                kind: .h,
                values:                 [
                    0, 0
                ]
            ),
            Coefficient(
                n: 9,
                m: 1,
                kind: .g,
                values:                 [
                    8.2, 7.2
                ]
            ),
            Coefficient(
                n: 9,
                m: 1,
                kind: .h,
                values:                 [
                    -23.3, -24.8
                ]
            ),
            Coefficient(
                n: 9,
                m: 2,
                kind: .g,
                values:                 [
                    2.9, 2.9
                ]
            ),
            Coefficient(
                n: 9,
                m: 2,
                kind: .h,
                values:                 [
                    11.1, 12.1
                ]
            ),
            Coefficient(
                n: 9,
                m: 3,
                kind: .g,
                values:                 [
                    -1.4, 0.6
                ]
            ),
            Coefficient(
                n: 9,
                m: 3,
                kind: .h,
                values:                 [
                    9.8, 7.8
                ]
            ),
            Coefficient(
                n: 9,
                m: 4,
                kind: .g,
                values:                 [
                    -1.1, -2.6
                ]
            ),
            Coefficient(
                n: 9,
                m: 4,
                kind: .h,
                values:                 [
                    -5.1, -3.1
                ]
            ),
            Coefficient(
                n: 9,
                m: 5,
                kind: .g,
                values:                 [
                    -13.3, -13.3
                ]
            ),
            Coefficient(
                n: 9,
                m: 5,
                kind: .h,
                values:                 [
                    -6.2, -5.7
                ]
            ),
            Coefficient(
                n: 9,
                m: 6,
                kind: .g,
                values:                 [
                    1.1, 2.6
                ]
            ),
            Coefficient(
                n: 9,
                m: 6,
                kind: .h,
                values:                 [
                    7.8, 7.8
                ]
            ),
            Coefficient(
                n: 9,
                m: 7,
                kind: .g,
                values:                 [
                    8.9, 8.9
                ]
            ),
            Coefficient(
                n: 9,
                m: 7,
                kind: .h,
                values:                 [
                    0.4, -0.6
                ]
            ),
            Coefficient(
                n: 9,
                m: 8,
                kind: .g,
                values:                 [
                    -9.3, -9.3
                ]
            ),
            Coefficient(
                n: 9,
                m: 8,
                kind: .h,
                values:                 [
                    -1.5, 1
                ]
            ),
            Coefficient(
                n: 9,
                m: 9,
                kind: .g,
                values:                 [
                    -11.9, -13.9
                ]
            ),
            Coefficient(
                n: 9,
                m: 9,
                kind: .h,
                values:                 [
                    9.7, 10.7
                ]
            ),
            Coefficient(
                n: 10,
                m: 0,
                kind: .g,
                values:                 [
                    -1.9, -1.9
                ]
            ),
            Coefficient(
                n: 10,
                m: 0,
                kind: .h,
                values:                 [
                    0, 0
                ]
            ),
            Coefficient(
                n: 10,
                m: 1,
                kind: .g,
                values:                 [
                    -6.2, -6.2
                ]
            ),
            Coefficient(
                n: 10,
                m: 1,
                kind: .h,
                values:                 [
                    3.4, 3.4
                ]
            ),
            Coefficient(
                n: 10,
                m: 2,
                kind: .g,
                values:                 [
                    -0.1, -0.1
                ]
            ),
            Coefficient(
                n: 10,
                m: 2,
                kind: .h,
                values:                 [
                    -0.2, 0.3
                ]
            ),
            Coefficient(
                n: 10,
                m: 3,
                kind: .g,
                values:                 [
                    1.7, 2.7
                ]
            ),
            Coefficient(
                n: 10,
                m: 3,
                kind: .h,
                values:                 [
                    3.5, 2
                ]
            ),
            Coefficient(
                n: 10,
                m: 4,
                kind: .g,
                values:                 [
                    -0.9, -1.4
                ]
            ),
            Coefficient(
                n: 10,
                m: 4,
                kind: .h,
                values:                 [
                    4.8, 5.3
                ]
            ),
            Coefficient(
                n: 10,
                m: 5,
                kind: .g,
                values:                 [
                    0.6, -0.4
                ]
            ),
            Coefficient(
                n: 10,
                m: 5,
                kind: .h,
                values:                 [
                    -8.6, -9.6
                ]
            ),
            Coefficient(
                n: 10,
                m: 6,
                kind: .g,
                values:                 [
                    -0.9, -0.9
                ]
            ),
            Coefficient(
                n: 10,
                m: 6,
                kind: .h,
                values:                 [
                    -0.1, 0.4
                ]
            ),
            Coefficient(
                n: 10,
                m: 7,
                kind: .g,
                values:                 [
                    1.9, 1.4
                ]
            ),
            Coefficient(
                n: 10,
                m: 7,
                kind: .h,
                values:                 [
                    -4.2, -4.2
                ]
            ),
            Coefficient(
                n: 10,
                m: 8,
                kind: .g,
                values:                 [
                    1.4, 0.4
                ]
            ),
            Coefficient(
                n: 10,
                m: 8,
                kind: .h,
                values:                 [
                    -3.4, -3.9
                ]
            ),
            Coefficient(
                n: 10,
                m: 9,
                kind: .g,
                values:                 [
                    -2.4, -2.9
                ]
            ),
            Coefficient(
                n: 10,
                m: 9,
                kind: .h,
                values:                 [
                    -0.1, 0.9
                ]
            ),
            Coefficient(
                n: 10,
                m: 10,
                kind: .g,
                values:                 [
                    -3.9, -3.9
                ]
            ),
            Coefficient(
                n: 10,
                m: 10,
                kind: .h,
                values:                 [
                    -8.8, -8.8
                ]
            ),
            Coefficient(
                n: 11,
                m: 0,
                kind: .g,
                values:                 [
                    3, 3
                ]
            ),
            Coefficient(
                n: 11,
                m: 0,
                kind: .h,
                values:                 [
                    0, 0
                ]
            ),
            Coefficient(
                n: 11,
                m: 1,
                kind: .g,
                values:                 [
                    -1.4, -1.9
                ]
            ),
            Coefficient(
                n: 11,
                m: 1,
                kind: .h,
                values:                 [
                    -0, -0
                ]
            ),
            Coefficient(
                n: 11,
                m: 2,
                kind: .g,
                values:                 [
                    -2.5, -2.5
                ]
            ),
            Coefficient(
                n: 11,
                m: 2,
                kind: .h,
                values:                 [
                    2.6, 3.1
                ]
            ),
            Coefficient(
                n: 11,
                m: 3,
                kind: .g,
                values:                 [
                    2.4, 2.4
                ]
            ),
            Coefficient(
                n: 11,
                m: 3,
                kind: .h,
                values:                 [
                    -0.5, -0.5
                ]
            ),
            Coefficient(
                n: 11,
                m: 4,
                kind: .g,
                values:                 [
                    -0.9, -0.9
                ]
            ),
            Coefficient(
                n: 11,
                m: 4,
                kind: .h,
                values:                 [
                    -0.4, 0.6
                ]
            ),
            Coefficient(
                n: 11,
                m: 5,
                kind: .g,
                values:                 [
                    0.3, -0.2
                ]
            ),
            Coefficient(
                n: 11,
                m: 5,
                kind: .h,
                values:                 [
                    0.6, 0.6
                ]
            ),
            Coefficient(
                n: 11,
                m: 6,
                kind: .g,
                values:                 [
                    -0.7, -0.7
                ]
            ),
            Coefficient(
                n: 11,
                m: 6,
                kind: .h,
                values:                 [
                    -0.2, -0.2
                ]
            ),
            Coefficient(
                n: 11,
                m: 7,
                kind: .g,
                values:                 [
                    -0.1, -0.1
                ]
            ),
            Coefficient(
                n: 11,
                m: 7,
                kind: .h,
                values:                 [
                    -1.7, -1.2
                ]
            ),
            Coefficient(
                n: 11,
                m: 8,
                kind: .g,
                values:                 [
                    1.4, 0.9
                ]
            ),
            Coefficient(
                n: 11,
                m: 8,
                kind: .h,
                values:                 [
                    -1.6, -1.6
                ]
            ),
            Coefficient(
                n: 11,
                m: 9,
                kind: .g,
                values:                 [
                    -0.6, -1.1
                ]
            ),
            Coefficient(
                n: 11,
                m: 9,
                kind: .h,
                values:                 [
                    -3, -3.5
                ]
            ),
            Coefficient(
                n: 11,
                m: 10,
                kind: .g,
                values:                 [
                    0.2, -0.3
                ]
            ),
            Coefficient(
                n: 11,
                m: 10,
                kind: .h,
                values:                 [
                    -2, -2
                ]
            ),
            Coefficient(
                n: 11,
                m: 11,
                kind: .g,
                values:                 [
                    3.1, 2.6
                ]
            ),
            Coefficient(
                n: 11,
                m: 11,
                kind: .h,
                values:                 [
                    -2.6, -2.6
                ]
            ),
            Coefficient(
                n: 12,
                m: 0,
                kind: .g,
                values:                 [
                    -2, -2
                ]
            ),
            Coefficient(
                n: 12,
                m: 0,
                kind: .h,
                values:                 [
                    0, 0
                ]
            ),
            Coefficient(
                n: 12,
                m: 1,
                kind: .g,
                values:                 [
                    -0.1, -0.1
                ]
            ),
            Coefficient(
                n: 12,
                m: 1,
                kind: .h,
                values:                 [
                    -1.2, -1.2
                ]
            ),
            Coefficient(
                n: 12,
                m: 2,
                kind: .g,
                values:                 [
                    0.5, 0.5
                ]
            ),
            Coefficient(
                n: 12,
                m: 2,
                kind: .h,
                values:                 [
                    0.5, 0.5
                ]
            ),
            Coefficient(
                n: 12,
                m: 3,
                kind: .g,
                values:                 [
                    1.3, 1.3
                ]
            ),
            Coefficient(
                n: 12,
                m: 3,
                kind: .h,
                values:                 [
                    1.3, 0.8
                ]
            ),
            Coefficient(
                n: 12,
                m: 4,
                kind: .g,
                values:                 [
                    -1.2, -1.2
                ]
            ),
            Coefficient(
                n: 12,
                m: 4,
                kind: .h,
                values:                 [
                    -1.8, -1.3
                ]
            ),
            Coefficient(
                n: 12,
                m: 5,
                kind: .g,
                values:                 [
                    0.7, 0.7
                ]
            ),
            Coefficient(
                n: 12,
                m: 5,
                kind: .h,
                values:                 [
                    0.1, 0.1
                ]
            ),
            Coefficient(
                n: 12,
                m: 6,
                kind: .g,
                values:                 [
                    0.3, 0.3
                ]
            ),
            Coefficient(
                n: 12,
                m: 6,
                kind: .h,
                values:                 [
                    0.7, 0.7
                ]
            ),
            Coefficient(
                n: 12,
                m: 7,
                kind: .g,
                values:                 [
                    0.5, 0.5
                ]
            ),
            Coefficient(
                n: 12,
                m: 7,
                kind: .h,
                values:                 [
                    -0.1, -0.1
                ]
            ),
            Coefficient(
                n: 12,
                m: 8,
                kind: .g,
                values:                 [
                    -0.2, -0.2
                ]
            ),
            Coefficient(
                n: 12,
                m: 8,
                kind: .h,
                values:                 [
                    0.6, 1.1
                ]
            ),
            Coefficient(
                n: 12,
                m: 9,
                kind: .g,
                values:                 [
                    -0.5, -0.5
                ]
            ),
            Coefficient(
                n: 12,
                m: 9,
                kind: .h,
                values:                 [
                    0.2, 0.2
                ]
            ),
            Coefficient(
                n: 12,
                m: 10,
                kind: .g,
                values:                 [
                    0.1, 0.1
                ]
            ),
            Coefficient(
                n: 12,
                m: 10,
                kind: .h,
                values:                 [
                    -0.9, -0.9
                ]
            ),
            Coefficient(
                n: 12,
                m: 11,
                kind: .g,
                values:                 [
                    -1.1, -1.1
                ]
            ),
            Coefficient(
                n: 12,
                m: 11,
                kind: .h,
                values:                 [
                    -0, 0
                ]
            ),
            Coefficient(
                n: 12,
                m: 12,
                kind: .g,
                values:                 [
                    -0.3, -0.8
                ]
            ),
            Coefficient(
                n: 12,
                m: 12,
                kind: .h,
                values:                 [
                    0.5, 0
                ]
            ),
        ]
    )
}
