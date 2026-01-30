import Foundation

public extension SHCModel {
    /// 世界地磁模型 (WMM2010) 模型
    ///
    /// World Magnetic Model (WMM2010) model
    ///
    /// 该模型是由美国国家环境信息中心 (NCEI) 和英国地质调查局 (BGS) 联合发布的全球地磁场模型，
    /// 用于导航、定向和其他需要地磁场信息的应用。WMM 模型是一个球谐系数模型，
    /// 每五年更新一次，提供地磁场的当前状态和未来五年的预测。
    ///
    /// This model is a global magnetic field model jointly published by the National Centers for
    /// Environmental Information (NCEI) and the British Geological Survey (BGS). It is used for
    /// navigation, orientation, and other applications requiring magnetic field information.
    /// The WMM model is a spherical harmonic coefficient model that is updated every five years,
    /// providing the current state of the magnetic field and a five-year prediction.
    ///
    /// 模型文件: WMM.COF
    /// Model file: WMM.COF
    ///
    /// 有效 epoch: 2010 - 2015
    /// Valid epochs: 2010 - 2015
    static let wmm2010 = SHCModel(
        fileName: "WMM.COF",
        headers: [
            "2010.0            WMM-2010        11/20/2009"
        ],
        headerNumbers: [],
        epochs: [
            2010, 2015,
        ],
        coefficients: [
            Coefficient(
                n: 1,
                m: 0,
                kind: .g,
                values: [
                    -29496.6, -29438.6,
                ]
            ),
            Coefficient(
                n: 1,
                m: 0,
                kind: .h,
                values: [
                    0, 0,
                ]
            ),
            Coefficient(
                n: 1,
                m: 1,
                kind: .g,
                values: [
                    -1586.3, -1503.8,
                ]
            ),
            Coefficient(
                n: 1,
                m: 1,
                kind: .h,
                values: [
                    4944.4, 4814.9,
                ]
            ),
            Coefficient(
                n: 2,
                m: 0,
                kind: .g,
                values: [
                    -2396.6, -2457.1,
                ]
            ),
            Coefficient(
                n: 2,
                m: 0,
                kind: .h,
                values: [
                    0, 0,
                ]
            ),
            Coefficient(
                n: 2,
                m: 1,
                kind: .g,
                values: [
                    3026.1, 3004.1,
                ]
            ),
            Coefficient(
                n: 2,
                m: 1,
                kind: .h,
                values: [
                    -2707.7, -2820.2,
                ]
            ),
            Coefficient(
                n: 2,
                m: 2,
                kind: .g,
                values: [
                    1668.6, 1678.1,
                ]
            ),
            Coefficient(
                n: 2,
                m: 2,
                kind: .h,
                values: [
                    -576.1, -635.1,
                ]
            ),
            Coefficient(
                n: 3,
                m: 0,
                kind: .g,
                values: [
                    1340.1, 1342.1,
                ]
            ),
            Coefficient(
                n: 3,
                m: 0,
                kind: .h,
                values: [
                    0, 0,
                ]
            ),
            Coefficient(
                n: 3,
                m: 1,
                kind: .g,
                values: [
                    -2326.2, -2346.7,
                ]
            ),
            Coefficient(
                n: 3,
                m: 1,
                kind: .h,
                values: [
                    -160.2, -123.7,
                ]
            ),
            Coefficient(
                n: 3,
                m: 2,
                kind: .g,
                values: [
                    1231.9, 1217.4,
                ]
            ),
            Coefficient(
                n: 3,
                m: 2,
                kind: .h,
                values: [
                    251.9, 232.4,
                ]
            ),
            Coefficient(
                n: 3,
                m: 3,
                kind: .g,
                values: [
                    634, 595.5,
                ]
            ),
            Coefficient(
                n: 3,
                m: 3,
                kind: .h,
                values: [
                    -536.6, -549.6,
                ]
            ),
            Coefficient(
                n: 4,
                m: 0,
                kind: .g,
                values: [
                    912.6, 903.6,
                ]
            ),
            Coefficient(
                n: 4,
                m: 0,
                kind: .h,
                values: [
                    0, 0,
                ]
            ),
            Coefficient(
                n: 4,
                m: 1,
                kind: .g,
                values: [
                    808.9, 820.4,
                ]
            ),
            Coefficient(
                n: 4,
                m: 1,
                kind: .h,
                values: [
                    286.4, 291.9,
                ]
            ),
            Coefficient(
                n: 4,
                m: 2,
                kind: .g,
                values: [
                    166.7, 123.2,
                ]
            ),
            Coefficient(
                n: 4,
                m: 2,
                kind: .h,
                values: [
                    -211.2, -197.7,
                ]
            ),
            Coefficient(
                n: 4,
                m: 3,
                kind: .g,
                values: [
                    -357.1, -334.1,
                ]
            ),
            Coefficient(
                n: 4,
                m: 3,
                kind: .h,
                values: [
                    164.3, 183.8,
                ]
            ),
            Coefficient(
                n: 4,
                m: 4,
                kind: .g,
                values: [
                    89.4, 78.9,
                ]
            ),
            Coefficient(
                n: 4,
                m: 4,
                kind: .h,
                values: [
                    -309.1, -313.1,
                ]
            ),
            Coefficient(
                n: 5,
                m: 0,
                kind: .g,
                values: [
                    -230.9, -235.9,
                ]
            ),
            Coefficient(
                n: 5,
                m: 0,
                kind: .h,
                values: [
                    0, 0,
                ]
            ),
            Coefficient(
                n: 5,
                m: 1,
                kind: .g,
                values: [
                    357.2, 360.2,
                ]
            ),
            Coefficient(
                n: 5,
                m: 1,
                kind: .h,
                values: [
                    44.6, 46.6,
                ]
            ),
            Coefficient(
                n: 5,
                m: 2,
                kind: .g,
                values: [
                    200.3, 191.3,
                ]
            ),
            Coefficient(
                n: 5,
                m: 2,
                kind: .h,
                values: [
                    188.9, 197.9,
                ]
            ),
            Coefficient(
                n: 5,
                m: 3,
                kind: .g,
                values: [
                    -141.1, -146.1,
                ]
            ),
            Coefficient(
                n: 5,
                m: 3,
                kind: .h,
                values: [
                    -118.2, -112.2,
                ]
            ),
            Coefficient(
                n: 5,
                m: 4,
                kind: .g,
                values: [
                    -163, -158.5,
                ]
            ),
            Coefficient(
                n: 5,
                m: 4,
                kind: .h,
                values: [
                    0, 20,
                ]
            ),
            Coefficient(
                n: 5,
                m: 5,
                kind: .g,
                values: [
                    -7.8, -2.8,
                ]
            ),
            Coefficient(
                n: 5,
                m: 5,
                kind: .h,
                values: [
                    100.9, 97.9,
                ]
            ),
            Coefficient(
                n: 6,
                m: 0,
                kind: .g,
                values: [
                    72.8, 71.8,
                ]
            ),
            Coefficient(
                n: 6,
                m: 0,
                kind: .h,
                values: [
                    0, 0,
                ]
            ),
            Coefficient(
                n: 6,
                m: 1,
                kind: .g,
                values: [
                    68.6, 67.6,
                ]
            ),
            Coefficient(
                n: 6,
                m: 1,
                kind: .h,
                values: [
                    -20.8, -21.8,
                ]
            ),
            Coefficient(
                n: 6,
                m: 2,
                kind: .g,
                values: [
                    76, 75.5,
                ]
            ),
            Coefficient(
                n: 6,
                m: 2,
                kind: .h,
                values: [
                    44.1, 33.6,
                ]
            ),
            Coefficient(
                n: 6,
                m: 3,
                kind: .g,
                values: [
                    -141.4, -131.4,
                ]
            ),
            Coefficient(
                n: 6,
                m: 3,
                kind: .h,
                values: [
                    61.5, 59.5,
                ]
            ),
            Coefficient(
                n: 6,
                m: 4,
                kind: .g,
                values: [
                    -22.8, -31.3,
                ]
            ),
            Coefficient(
                n: 6,
                m: 4,
                kind: .h,
                values: [
                    -66.3, -69.3,
                ]
            ),
            Coefficient(
                n: 6,
                m: 5,
                kind: .g,
                values: [
                    13.2, 11.7,
                ]
            ),
            Coefficient(
                n: 6,
                m: 5,
                kind: .h,
                values: [
                    3.1, 5.6,
                ]
            ),
            Coefficient(
                n: 6,
                m: 6,
                kind: .g,
                values: [
                    -77.9, -69.4,
                ]
            ),
            Coefficient(
                n: 6,
                m: 6,
                kind: .h,
                values: [
                    55, 59.5,
                ]
            ),
            Coefficient(
                n: 7,
                m: 0,
                kind: .g,
                values: [
                    80.5, 81,
                ]
            ),
            Coefficient(
                n: 7,
                m: 0,
                kind: .h,
                values: [
                    0, 0,
                ]
            ),
            Coefficient(
                n: 7,
                m: 1,
                kind: .g,
                values: [
                    -75.1, -75.6,
                ]
            ),
            Coefficient(
                n: 7,
                m: 1,
                kind: .h,
                values: [
                    -57.9, -54.4,
                ]
            ),
            Coefficient(
                n: 7,
                m: 2,
                kind: .g,
                values: [
                    -4.7, -7.7,
                ]
            ),
            Coefficient(
                n: 7,
                m: 2,
                kind: .h,
                values: [
                    -21.1, -19.6,
                ]
            ),
            Coefficient(
                n: 7,
                m: 3,
                kind: .g,
                values: [
                    45.3, 51.8,
                ]
            ),
            Coefficient(
                n: 7,
                m: 3,
                kind: .h,
                values: [
                    6.5, 6,
                ]
            ),
            Coefficient(
                n: 7,
                m: 4,
                kind: .g,
                values: [
                    13.9, 15.9,
                ]
            ),
            Coefficient(
                n: 7,
                m: 4,
                kind: .h,
                values: [
                    24.9, 24.4,
                ]
            ),
            Coefficient(
                n: 7,
                m: 5,
                kind: .g,
                values: [
                    10.4, 11.9,
                ]
            ),
            Coefficient(
                n: 7,
                m: 5,
                kind: .h,
                values: [
                    7, 3,
                ]
            ),
            Coefficient(
                n: 7,
                m: 6,
                kind: .g,
                values: [
                    1.7, -1.8,
                ]
            ),
            Coefficient(
                n: 7,
                m: 6,
                kind: .h,
                values: [
                    -27.7, -29.2,
                ]
            ),
            Coefficient(
                n: 7,
                m: 7,
                kind: .g,
                values: [
                    4.9, 7.9,
                ]
            ),
            Coefficient(
                n: 7,
                m: 7,
                kind: .h,
                values: [
                    -3.3, -1.8,
                ]
            ),
            Coefficient(
                n: 8,
                m: 0,
                kind: .g,
                values: [
                    24.4, 23.9,
                ]
            ),
            Coefficient(
                n: 8,
                m: 0,
                kind: .h,
                values: [
                    0, 0,
                ]
            ),
            Coefficient(
                n: 8,
                m: 1,
                kind: .g,
                values: [
                    8.1, 8.6,
                ]
            ),
            Coefficient(
                n: 8,
                m: 1,
                kind: .h,
                values: [
                    11, 10.5,
                ]
            ),
            Coefficient(
                n: 8,
                m: 2,
                kind: .g,
                values: [
                    -14.5, -17.5,
                ]
            ),
            Coefficient(
                n: 8,
                m: 2,
                kind: .h,
                values: [
                    -20, -19,
                ]
            ),
            Coefficient(
                n: 8,
                m: 3,
                kind: .g,
                values: [
                    -5.6, -4.6,
                ]
            ),
            Coefficient(
                n: 8,
                m: 3,
                kind: .h,
                values: [
                    11.9, 13.9,
                ]
            ),
            Coefficient(
                n: 8,
                m: 4,
                kind: .g,
                values: [
                    -19.3, -20.3,
                ]
            ),
            Coefficient(
                n: 8,
                m: 4,
                kind: .h,
                values: [
                    -17.4, -15.4,
                ]
            ),
            Coefficient(
                n: 8,
                m: 5,
                kind: .g,
                values: [
                    11.5, 13,
                ]
            ),
            Coefficient(
                n: 8,
                m: 5,
                kind: .h,
                values: [
                    16.7, 17.2,
                ]
            ),
            Coefficient(
                n: 8,
                m: 6,
                kind: .g,
                values: [
                    10.9, 12.4,
                ]
            ),
            Coefficient(
                n: 8,
                m: 6,
                kind: .h,
                values: [
                    7, 6.5,
                ]
            ),
            Coefficient(
                n: 8,
                m: 7,
                kind: .g,
                values: [
                    -14.1, -17.1,
                ]
            ),
            Coefficient(
                n: 8,
                m: 7,
                kind: .h,
                values: [
                    -10.8, -8.8,
                ]
            ),
            Coefficient(
                n: 8,
                m: 8,
                kind: .g,
                values: [
                    -3.7, -2.7,
                ]
            ),
            Coefficient(
                n: 8,
                m: 8,
                kind: .h,
                values: [
                    1.7, 3.2,
                ]
            ),
            Coefficient(
                n: 9,
                m: 0,
                kind: .g,
                values: [
                    5.4, 5.4,
                ]
            ),
            Coefficient(
                n: 9,
                m: 0,
                kind: .h,
                values: [
                    0, 0,
                ]
            ),
            Coefficient(
                n: 9,
                m: 1,
                kind: .g,
                values: [
                    9.4, 8.9,
                ]
            ),
            Coefficient(
                n: 9,
                m: 1,
                kind: .h,
                values: [
                    -20.5, -20.5,
                ]
            ),
            Coefficient(
                n: 9,
                m: 2,
                kind: .g,
                values: [
                    3.4, 3.4,
                ]
            ),
            Coefficient(
                n: 9,
                m: 2,
                kind: .h,
                values: [
                    11.5, 10.5,
                ]
            ),
            Coefficient(
                n: 9,
                m: 3,
                kind: .g,
                values: [
                    -5.2, -3.7,
                ]
            ),
            Coefficient(
                n: 9,
                m: 3,
                kind: .h,
                values: [
                    12.8, 12.8,
                ]
            ),
            Coefficient(
                n: 9,
                m: 4,
                kind: .g,
                values: [
                    3.1, 1.1,
                ]
            ),
            Coefficient(
                n: 9,
                m: 4,
                kind: .h,
                values: [
                    -7.2, -7.7,
                ]
            ),
            Coefficient(
                n: 9,
                m: 5,
                kind: .g,
                values: [
                    -12.4, -13.9,
                ]
            ),
            Coefficient(
                n: 9,
                m: 5,
                kind: .h,
                values: [
                    -7.4, -6.9,
                ]
            ),
            Coefficient(
                n: 9,
                m: 6,
                kind: .g,
                values: [
                    -0.7, -0.2,
                ]
            ),
            Coefficient(
                n: 9,
                m: 6,
                kind: .h,
                values: [
                    8, 8,
                ]
            ),
            Coefficient(
                n: 9,
                m: 7,
                kind: .g,
                values: [
                    8.4, 7.9,
                ]
            ),
            Coefficient(
                n: 9,
                m: 7,
                kind: .h,
                values: [
                    2.1, 1.1,
                ]
            ),
            Coefficient(
                n: 9,
                m: 8,
                kind: .g,
                values: [
                    -8.5, -10.5,
                ]
            ),
            Coefficient(
                n: 9,
                m: 8,
                kind: .h,
                values: [
                    -6.1, -4.6,
                ]
            ),
            Coefficient(
                n: 9,
                m: 9,
                kind: .g,
                values: [
                    -10.1, -11.1,
                ]
            ),
            Coefficient(
                n: 9,
                m: 9,
                kind: .h,
                values: [
                    7, 8,
                ]
            ),
            Coefficient(
                n: 10,
                m: 0,
                kind: .g,
                values: [
                    -2, -2,
                ]
            ),
            Coefficient(
                n: 10,
                m: 0,
                kind: .h,
                values: [
                    0, 0,
                ]
            ),
            Coefficient(
                n: 10,
                m: 1,
                kind: .g,
                values: [
                    -6.3, -6.3,
                ]
            ),
            Coefficient(
                n: 10,
                m: 1,
                kind: .h,
                values: [
                    2.8, 3.3,
                ]
            ),
            Coefficient(
                n: 10,
                m: 2,
                kind: .g,
                values: [
                    0.9, 0.4,
                ]
            ),
            Coefficient(
                n: 10,
                m: 2,
                kind: .h,
                values: [
                    -0.1, -0.6,
                ]
            ),
            Coefficient(
                n: 10,
                m: 3,
                kind: .g,
                values: [
                    -1.1, -0.1,
                ]
            ),
            Coefficient(
                n: 10,
                m: 3,
                kind: .h,
                values: [
                    4.7, 4.7,
                ]
            ),
            Coefficient(
                n: 10,
                m: 4,
                kind: .g,
                values: [
                    -0.2, -0.2,
                ]
            ),
            Coefficient(
                n: 10,
                m: 4,
                kind: .h,
                values: [
                    4.4, 3.9,
                ]
            ),
            Coefficient(
                n: 10,
                m: 5,
                kind: .g,
                values: [
                    2.5, 2,
                ]
            ),
            Coefficient(
                n: 10,
                m: 5,
                kind: .h,
                values: [
                    -7.2, -7.7,
                ]
            ),
            Coefficient(
                n: 10,
                m: 6,
                kind: .g,
                values: [
                    -0.3, -1.3,
                ]
            ),
            Coefficient(
                n: 10,
                m: 6,
                kind: .h,
                values: [
                    -1, -1,
                ]
            ),
            Coefficient(
                n: 10,
                m: 7,
                kind: .g,
                values: [
                    2.2, 2.2,
                ]
            ),
            Coefficient(
                n: 10,
                m: 7,
                kind: .h,
                values: [
                    -3.9, -4.4,
                ]
            ),
            Coefficient(
                n: 10,
                m: 8,
                kind: .g,
                values: [
                    3.1, 2.6,
                ]
            ),
            Coefficient(
                n: 10,
                m: 8,
                kind: .h,
                values: [
                    -2, -3,
                ]
            ),
            Coefficient(
                n: 10,
                m: 9,
                kind: .g,
                values: [
                    -1, -2,
                ]
            ),
            Coefficient(
                n: 10,
                m: 9,
                kind: .h,
                values: [
                    -2, -2,
                ]
            ),
            Coefficient(
                n: 10,
                m: 10,
                kind: .g,
                values: [
                    -2.8, -3.8,
                ]
            ),
            Coefficient(
                n: 10,
                m: 10,
                kind: .h,
                values: [
                    -8.3, -8.8,
                ]
            ),
            Coefficient(
                n: 11,
                m: 0,
                kind: .g,
                values: [
                    3, 3,
                ]
            ),
            Coefficient(
                n: 11,
                m: 0,
                kind: .h,
                values: [
                    0, 0,
                ]
            ),
            Coefficient(
                n: 11,
                m: 1,
                kind: .g,
                values: [
                    -1.5, -1.5,
                ]
            ),
            Coefficient(
                n: 11,
                m: 1,
                kind: .h,
                values: [
                    0.2, 0.2,
                ]
            ),
            Coefficient(
                n: 11,
                m: 2,
                kind: .g,
                values: [
                    -2.1, -2.1,
                ]
            ),
            Coefficient(
                n: 11,
                m: 2,
                kind: .h,
                values: [
                    1.7, 2.2,
                ]
            ),
            Coefficient(
                n: 11,
                m: 3,
                kind: .g,
                values: [
                    1.7, 2.2,
                ]
            ),
            Coefficient(
                n: 11,
                m: 3,
                kind: .h,
                values: [
                    -0.6, -0.6,
                ]
            ),
            Coefficient(
                n: 11,
                m: 4,
                kind: .g,
                values: [
                    -0.5, -0.5,
                ]
            ),
            Coefficient(
                n: 11,
                m: 4,
                kind: .h,
                values: [
                    -1.8, -1.3,
                ]
            ),
            Coefficient(
                n: 11,
                m: 5,
                kind: .g,
                values: [
                    0.5, 0.5,
                ]
            ),
            Coefficient(
                n: 11,
                m: 5,
                kind: .h,
                values: [
                    0.9, 0.9,
                ]
            ),
            Coefficient(
                n: 11,
                m: 6,
                kind: .g,
                values: [
                    -0.8, -0.8,
                ]
            ),
            Coefficient(
                n: 11,
                m: 6,
                kind: .h,
                values: [
                    -0.4, 0.1,
                ]
            ),
            Coefficient(
                n: 11,
                m: 7,
                kind: .g,
                values: [
                    0.4, 0.4,
                ]
            ),
            Coefficient(
                n: 11,
                m: 7,
                kind: .h,
                values: [
                    -2.5, -2.5,
                ]
            ),
            Coefficient(
                n: 11,
                m: 8,
                kind: .g,
                values: [
                    1.8, 1.8,
                ]
            ),
            Coefficient(
                n: 11,
                m: 8,
                kind: .h,
                values: [
                    -1.3, -1.8,
                ]
            ),
            Coefficient(
                n: 11,
                m: 9,
                kind: .g,
                values: [
                    0.1, 0.1,
                ]
            ),
            Coefficient(
                n: 11,
                m: 9,
                kind: .h,
                values: [
                    -2.1, -2.6,
                ]
            ),
            Coefficient(
                n: 11,
                m: 10,
                kind: .g,
                values: [
                    0.7, 0.2,
                ]
            ),
            Coefficient(
                n: 11,
                m: 10,
                kind: .h,
                values: [
                    -1.9, -1.9,
                ]
            ),
            Coefficient(
                n: 11,
                m: 11,
                kind: .g,
                values: [
                    3.8, 3.8,
                ]
            ),
            Coefficient(
                n: 11,
                m: 11,
                kind: .h,
                values: [
                    -1.8, -2.3,
                ]
            ),
            Coefficient(
                n: 12,
                m: 0,
                kind: .g,
                values: [
                    -2.2, -2.2,
                ]
            ),
            Coefficient(
                n: 12,
                m: 0,
                kind: .h,
                values: [
                    0, 0,
                ]
            ),
            Coefficient(
                n: 12,
                m: 1,
                kind: .g,
                values: [
                    -0.2, -0.2,
                ]
            ),
            Coefficient(
                n: 12,
                m: 1,
                kind: .h,
                values: [
                    -0.9, -0.9,
                ]
            ),
            Coefficient(
                n: 12,
                m: 2,
                kind: .g,
                values: [
                    0.3, 0.8,
                ]
            ),
            Coefficient(
                n: 12,
                m: 2,
                kind: .h,
                values: [
                    0.3, 0.3,
                ]
            ),
            Coefficient(
                n: 12,
                m: 3,
                kind: .g,
                values: [
                    1, 1.5,
                ]
            ),
            Coefficient(
                n: 12,
                m: 3,
                kind: .h,
                values: [
                    2.1, 2.1,
                ]
            ),
            Coefficient(
                n: 12,
                m: 4,
                kind: .g,
                values: [
                    -0.6, -1.1,
                ]
            ),
            Coefficient(
                n: 12,
                m: 4,
                kind: .h,
                values: [
                    -2.5, -2.5,
                ]
            ),
            Coefficient(
                n: 12,
                m: 5,
                kind: .g,
                values: [
                    0.9, 0.9,
                ]
            ),
            Coefficient(
                n: 12,
                m: 5,
                kind: .h,
                values: [
                    0.5, 0.5,
                ]
            ),
            Coefficient(
                n: 12,
                m: 6,
                kind: .g,
                values: [
                    -0.1, -0.1,
                ]
            ),
            Coefficient(
                n: 12,
                m: 6,
                kind: .h,
                values: [
                    0.6, 1.1,
                ]
            ),
            Coefficient(
                n: 12,
                m: 7,
                kind: .g,
                values: [
                    0.5, 0.5,
                ]
            ),
            Coefficient(
                n: 12,
                m: 7,
                kind: .h,
                values: [
                    0, 0,
                ]
            ),
            Coefficient(
                n: 12,
                m: 8,
                kind: .g,
                values: [
                    -0.4, -0.4,
                ]
            ),
            Coefficient(
                n: 12,
                m: 8,
                kind: .h,
                values: [
                    0.1, 0.1,
                ]
            ),
            Coefficient(
                n: 12,
                m: 9,
                kind: .g,
                values: [
                    -0.4, -0.4,
                ]
            ),
            Coefficient(
                n: 12,
                m: 9,
                kind: .h,
                values: [
                    0.3, 0.3,
                ]
            ),
            Coefficient(
                n: 12,
                m: 10,
                kind: .g,
                values: [
                    0.2, 0.2,
                ]
            ),
            Coefficient(
                n: 12,
                m: 10,
                kind: .h,
                values: [
                    -0.9, -0.9,
                ]
            ),
            Coefficient(
                n: 12,
                m: 11,
                kind: .g,
                values: [
                    -0.8, -1.3,
                ]
            ),
            Coefficient(
                n: 12,
                m: 11,
                kind: .h,
                values: [
                    -0.2, -0.2,
                ]
            ),
            Coefficient(
                n: 12,
                m: 12,
                kind: .g,
                values: [
                    0, 0.5,
                ]
            ),
            Coefficient(
                n: 12,
                m: 12,
                kind: .h,
                values: [
                    0.9, 0.9,
                ]
            ),
        ]
    )
}
