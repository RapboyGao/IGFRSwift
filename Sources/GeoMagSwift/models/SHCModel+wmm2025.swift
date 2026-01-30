import Foundation

public extension SHCModel {
    /// 世界地磁模型 (WMM2025) 模型
    ///
    /// World Magnetic Model (WMM2025) model
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
    /// 有效 epoch: 2025 - 2030
    /// Valid epochs: 2025 - 2030
    static let wmm2025 = SHCModel(
        fileName: "WMM.COF",
        headers: [
            "2025.0            WMM-2025     11/13/2024"
        ],
        headerNumbers: [],
        epochs: [
            2025, 2030,
        ],
        coefficients: [
            Coefficient(
                n: 1,
                m: 0,
                kind: .g,
                values: [
                    -29351.8, -29291.8,
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
                    -1410.8, -1362.3,
                ]
            ),
            Coefficient(
                n: 1,
                m: 1,
                kind: .h,
                values: [
                    4545.4, 4437.9,
                ]
            ),
            Coefficient(
                n: 2,
                m: 0,
                kind: .g,
                values: [
                    -2556.6, -2614.6,
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
                    2951.1, 2925.1,
                ]
            ),
            Coefficient(
                n: 2,
                m: 1,
                kind: .h,
                values: [
                    -3133.6, -3272.1,
                ]
            ),
            Coefficient(
                n: 2,
                m: 2,
                kind: .g,
                values: [
                    1649.3, 1609.3,
                ]
            ),
            Coefficient(
                n: 2,
                m: 2,
                kind: .h,
                values: [
                    -815.1, -875.6,
                ]
            ),
            Coefficient(
                n: 3,
                m: 0,
                kind: .g,
                values: [
                    1361, 1354.5,
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
                    -2404.1, -2425.1,
                ]
            ),
            Coefficient(
                n: 3,
                m: 1,
                kind: .h,
                values: [
                    -56.6, -36.6,
                ]
            ),
            Coefficient(
                n: 3,
                m: 2,
                kind: .g,
                values: [
                    1243.8, 1245.8,
                ]
            ),
            Coefficient(
                n: 3,
                m: 2,
                kind: .h,
                values: [
                    237.5, 236,
                ]
            ),
            Coefficient(
                n: 3,
                m: 3,
                kind: .g,
                values: [
                    453.6, 375.6,
                ]
            ),
            Coefficient(
                n: 3,
                m: 3,
                kind: .h,
                values: [
                    -549.5, -570,
                ]
            ),
            Coefficient(
                n: 4,
                m: 0,
                kind: .g,
                values: [
                    895, 887,
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
                    799.5, 787.5,
                ]
            ),
            Coefficient(
                n: 4,
                m: 1,
                kind: .h,
                values: [
                    278.6, 273.1,
                ]
            ),
            Coefficient(
                n: 4,
                m: 2,
                kind: .g,
                values: [
                    55.7, 25.7,
                ]
            ),
            Coefficient(
                n: 4,
                m: 2,
                kind: .h,
                values: [
                    -133.9, -113.4,
                ]
            ),
            Coefficient(
                n: 4,
                m: 3,
                kind: .g,
                values: [
                    -281.1, -253.1,
                ]
            ),
            Coefficient(
                n: 4,
                m: 3,
                kind: .h,
                values: [
                    212, 220,
                ]
            ),
            Coefficient(
                n: 4,
                m: 4,
                kind: .g,
                values: [
                    12.1, -22.9,
                ]
            ),
            Coefficient(
                n: 4,
                m: 4,
                kind: .h,
                values: [
                    -375.6, -397.6,
                ]
            ),
            Coefficient(
                n: 5,
                m: 0,
                kind: .g,
                values: [
                    -233.2, -230.2,
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
                    368.9, 375.9,
                ]
            ),
            Coefficient(
                n: 5,
                m: 1,
                kind: .h,
                values: [
                    45.4, 42.9,
                ]
            ),
            Coefficient(
                n: 5,
                m: 2,
                kind: .g,
                values: [
                    187.2, 187.2,
                ]
            ),
            Coefficient(
                n: 5,
                m: 2,
                kind: .h,
                values: [
                    220.2, 231.2,
                ]
            ),
            Coefficient(
                n: 5,
                m: 3,
                kind: .g,
                values: [
                    -138.7, -135.7,
                ]
            ),
            Coefficient(
                n: 5,
                m: 3,
                kind: .h,
                values: [
                    -122.9, -120.9,
                ]
            ),
            Coefficient(
                n: 5,
                m: 4,
                kind: .g,
                values: [
                    -142, -131,
                ]
            ),
            Coefficient(
                n: 5,
                m: 4,
                kind: .h,
                values: [
                    43, 51.5,
                ]
            ),
            Coefficient(
                n: 5,
                m: 5,
                kind: .g,
                values: [
                    20.9, 25.4,
                ]
            ),
            Coefficient(
                n: 5,
                m: 5,
                kind: .h,
                values: [
                    106.1, 115.6,
                ]
            ),
            Coefficient(
                n: 6,
                m: 0,
                kind: .g,
                values: [
                    64.4, 63.4,
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
                    63.8, 61.8,
                ]
            ),
            Coefficient(
                n: 6,
                m: 1,
                kind: .h,
                values: [
                    -18.4, -16.9,
                ]
            ),
            Coefficient(
                n: 6,
                m: 2,
                kind: .g,
                values: [
                    76.9, 81.4,
                ]
            ),
            Coefficient(
                n: 6,
                m: 2,
                kind: .h,
                values: [
                    16.8, 8.8,
                ]
            ),
            Coefficient(
                n: 6,
                m: 3,
                kind: .g,
                values: [
                    -115.7, -109.7,
                ]
            ),
            Coefficient(
                n: 6,
                m: 3,
                kind: .h,
                values: [
                    48.8, 46.8,
                ]
            ),
            Coefficient(
                n: 6,
                m: 4,
                kind: .g,
                values: [
                    -40.9, -45.4,
                ]
            ),
            Coefficient(
                n: 6,
                m: 4,
                kind: .h,
                values: [
                    -59.8, -55.3,
                ]
            ),
            Coefficient(
                n: 6,
                m: 5,
                kind: .g,
                values: [
                    14.9, 16.4,
                ]
            ),
            Coefficient(
                n: 6,
                m: 5,
                kind: .h,
                values: [
                    10.9, 14.4,
                ]
            ),
            Coefficient(
                n: 6,
                m: 6,
                kind: .g,
                values: [
                    -60.7, -56.2,
                ]
            ),
            Coefficient(
                n: 6,
                m: 6,
                kind: .h,
                values: [
                    72.7, 77.2,
                ]
            ),
            Coefficient(
                n: 7,
                m: 0,
                kind: .g,
                values: [
                    79.5, 79.5,
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
                    -77, -77.5,
                ]
            ),
            Coefficient(
                n: 7,
                m: 1,
                kind: .h,
                values: [
                    -48.9, -45.9,
                ]
            ),
            Coefficient(
                n: 7,
                m: 2,
                kind: .g,
                values: [
                    -8.8, -9.3,
                ]
            ),
            Coefficient(
                n: 7,
                m: 2,
                kind: .h,
                values: [
                    -14.4, -11.9,
                ]
            ),
            Coefficient(
                n: 7,
                m: 3,
                kind: .g,
                values: [
                    59.3, 61.8,
                ]
            ),
            Coefficient(
                n: 7,
                m: 3,
                kind: .h,
                values: [
                    -1, -5,
                ]
            ),
            Coefficient(
                n: 7,
                m: 4,
                kind: .g,
                values: [
                    15.8, 15.3,
                ]
            ),
            Coefficient(
                n: 7,
                m: 4,
                kind: .h,
                values: [
                    23.4, 23.4,
                ]
            ),
            Coefficient(
                n: 7,
                m: 5,
                kind: .g,
                values: [
                    2.5, -1.5,
                ]
            ),
            Coefficient(
                n: 7,
                m: 5,
                kind: .h,
                values: [
                    -7.4, -12.4,
                ]
            ),
            Coefficient(
                n: 7,
                m: 6,
                kind: .g,
                values: [
                    -11.1, -15.1,
                ]
            ),
            Coefficient(
                n: 7,
                m: 6,
                kind: .h,
                values: [
                    -25.1, -22.1,
                ]
            ),
            Coefficient(
                n: 7,
                m: 7,
                kind: .g,
                values: [
                    14.2, 18.2,
                ]
            ),
            Coefficient(
                n: 7,
                m: 7,
                kind: .h,
                values: [
                    -2.3, -3.3,
                ]
            ),
            Coefficient(
                n: 8,
                m: 0,
                kind: .g,
                values: [
                    23.2, 22.7,
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
                    10.8, 11.8,
                ]
            ),
            Coefficient(
                n: 8,
                m: 1,
                kind: .h,
                values: [
                    7.1, 6.1,
                ]
            ),
            Coefficient(
                n: 8,
                m: 2,
                kind: .g,
                values: [
                    -17.5, -17.5,
                ]
            ),
            Coefficient(
                n: 8,
                m: 2,
                kind: .h,
                values: [
                    -12.6, -10.1,
                ]
            ),
            Coefficient(
                n: 8,
                m: 3,
                kind: .g,
                values: [
                    2, 4.5,
                ]
            ),
            Coefficient(
                n: 8,
                m: 3,
                kind: .h,
                values: [
                    11.4, 9.4,
                ]
            ),
            Coefficient(
                n: 8,
                m: 4,
                kind: .g,
                values: [
                    -21.7, -22.2,
                ]
            ),
            Coefficient(
                n: 8,
                m: 4,
                kind: .h,
                values: [
                    -9.7, -7.7,
                ]
            ),
            Coefficient(
                n: 8,
                m: 5,
                kind: .g,
                values: [
                    16.9, 18.4,
                ]
            ),
            Coefficient(
                n: 8,
                m: 5,
                kind: .h,
                values: [
                    12.7, 10.2,
                ]
            ),
            Coefficient(
                n: 8,
                m: 6,
                kind: .g,
                values: [
                    15, 16,
                ]
            ),
            Coefficient(
                n: 8,
                m: 6,
                kind: .h,
                values: [
                    0.7, -2.3,
                ]
            ),
            Coefficient(
                n: 8,
                m: 7,
                kind: .g,
                values: [
                    -16.8, -16.8,
                ]
            ),
            Coefficient(
                n: 8,
                m: 7,
                kind: .h,
                values: [
                    -5.2, -3.7,
                ]
            ),
            Coefficient(
                n: 8,
                m: 8,
                kind: .g,
                values: [
                    0.9, 1.9,
                ]
            ),
            Coefficient(
                n: 8,
                m: 8,
                kind: .h,
                values: [
                    3.9, 4.9,
                ]
            ),
            Coefficient(
                n: 9,
                m: 0,
                kind: .g,
                values: [
                    4.6, 4.6,
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
                    7.8, 7.3,
                ]
            ),
            Coefficient(
                n: 9,
                m: 1,
                kind: .h,
                values: [
                    -24.8, -26.3,
                ]
            ),
            Coefficient(
                n: 9,
                m: 2,
                kind: .g,
                values: [
                    3, 3.5,
                ]
            ),
            Coefficient(
                n: 9,
                m: 2,
                kind: .h,
                values: [
                    12.2, 13.7,
                ]
            ),
            Coefficient(
                n: 9,
                m: 3,
                kind: .g,
                values: [
                    -0.2, 1.3,
                ]
            ),
            Coefficient(
                n: 9,
                m: 3,
                kind: .h,
                values: [
                    8.3, 6.8,
                ]
            ),
            Coefficient(
                n: 9,
                m: 4,
                kind: .g,
                values: [
                    -2.5, -4,
                ]
            ),
            Coefficient(
                n: 9,
                m: 4,
                kind: .h,
                values: [
                    -3.3, -1.8,
                ]
            ),
            Coefficient(
                n: 9,
                m: 5,
                kind: .g,
                values: [
                    -13.1, -13.1,
                ]
            ),
            Coefficient(
                n: 9,
                m: 5,
                kind: .h,
                values: [
                    -5.2, -4.2,
                ]
            ),
            Coefficient(
                n: 9,
                m: 6,
                kind: .g,
                values: [
                    2.4, 3.9,
                ]
            ),
            Coefficient(
                n: 9,
                m: 6,
                kind: .h,
                values: [
                    7.2, 6.7,
                ]
            ),
            Coefficient(
                n: 9,
                m: 7,
                kind: .g,
                values: [
                    8.6, 8.1,
                ]
            ),
            Coefficient(
                n: 9,
                m: 7,
                kind: .h,
                values: [
                    -0.6, -1.6,
                ]
            ),
            Coefficient(
                n: 9,
                m: 8,
                kind: .g,
                values: [
                    -8.7, -8.2,
                ]
            ),
            Coefficient(
                n: 9,
                m: 8,
                kind: .h,
                values: [
                    0.8, 2.8,
                ]
            ),
            Coefficient(
                n: 9,
                m: 9,
                kind: .g,
                values: [
                    -12.9, -13.4,
                ]
            ),
            Coefficient(
                n: 9,
                m: 9,
                kind: .h,
                values: [
                    10, 10.5,
                ]
            ),
            Coefficient(
                n: 10,
                m: 0,
                kind: .g,
                values: [
                    -1.3, -0.8,
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
                    -6.4, -6.4,
                ]
            ),
            Coefficient(
                n: 10,
                m: 1,
                kind: .h,
                values: [
                    3.3, 3.3,
                ]
            ),
            Coefficient(
                n: 10,
                m: 2,
                kind: .g,
                values: [
                    0.2, 0.7,
                ]
            ),
            Coefficient(
                n: 10,
                m: 2,
                kind: .h,
                values: [
                    0, 0,
                ]
            ),
            Coefficient(
                n: 10,
                m: 3,
                kind: .g,
                values: [
                    2, 2.5,
                ]
            ),
            Coefficient(
                n: 10,
                m: 3,
                kind: .h,
                values: [
                    2.4, 1.4,
                ]
            ),
            Coefficient(
                n: 10,
                m: 4,
                kind: .g,
                values: [
                    -1, -1,
                ]
            ),
            Coefficient(
                n: 10,
                m: 4,
                kind: .h,
                values: [
                    5.3, 5.8,
                ]
            ),
            Coefficient(
                n: 10,
                m: 5,
                kind: .g,
                values: [
                    -0.6, -2.1,
                ]
            ),
            Coefficient(
                n: 10,
                m: 5,
                kind: .h,
                values: [
                    -9.1, -9.6,
                ]
            ),
            Coefficient(
                n: 10,
                m: 6,
                kind: .g,
                values: [
                    -0.9, -0.9,
                ]
            ),
            Coefficient(
                n: 10,
                m: 6,
                kind: .h,
                values: [
                    0.4, 0.9,
                ]
            ),
            Coefficient(
                n: 10,
                m: 7,
                kind: .g,
                values: [
                    1.5, 1,
                ]
            ),
            Coefficient(
                n: 10,
                m: 7,
                kind: .h,
                values: [
                    -4.2, -4.2,
                ]
            ),
            Coefficient(
                n: 10,
                m: 8,
                kind: .g,
                values: [
                    0.9, 0.4,
                ]
            ),
            Coefficient(
                n: 10,
                m: 8,
                kind: .h,
                values: [
                    -3.8, -4.3,
                ]
            ),
            Coefficient(
                n: 10,
                m: 9,
                kind: .g,
                values: [
                    -2.7, -2.7,
                ]
            ),
            Coefficient(
                n: 10,
                m: 9,
                kind: .h,
                values: [
                    0.9, 1.9,
                ]
            ),
            Coefficient(
                n: 10,
                m: 10,
                kind: .g,
                values: [
                    -3.9, -3.9,
                ]
            ),
            Coefficient(
                n: 10,
                m: 10,
                kind: .h,
                values: [
                    -9.1, -9.1,
                ]
            ),
            Coefficient(
                n: 11,
                m: 0,
                kind: .g,
                values: [
                    2.9, 2.9,
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
                    0, 0,
                ]
            ),
            Coefficient(
                n: 11,
                m: 2,
                kind: .g,
                values: [
                    -2.5, -2.5,
                ]
            ),
            Coefficient(
                n: 11,
                m: 2,
                kind: .h,
                values: [
                    2.9, 3.4,
                ]
            ),
            Coefficient(
                n: 11,
                m: 3,
                kind: .g,
                values: [
                    2.4, 2.4,
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
                    -0.6, -0.6,
                ]
            ),
            Coefficient(
                n: 11,
                m: 4,
                kind: .h,
                values: [
                    0.2, 0.7,
                ]
            ),
            Coefficient(
                n: 11,
                m: 5,
                kind: .g,
                values: [
                    -0.1, -0.6,
                ]
            ),
            Coefficient(
                n: 11,
                m: 5,
                kind: .h,
                values: [
                    0.5, 0.5,
                ]
            ),
            Coefficient(
                n: 11,
                m: 6,
                kind: .g,
                values: [
                    -0.6, -0.6,
                ]
            ),
            Coefficient(
                n: 11,
                m: 6,
                kind: .h,
                values: [
                    -0.3, -0.3,
                ]
            ),
            Coefficient(
                n: 11,
                m: 7,
                kind: .g,
                values: [
                    -0.1, -0.1,
                ]
            ),
            Coefficient(
                n: 11,
                m: 7,
                kind: .h,
                values: [
                    -1.2, -0.7,
                ]
            ),
            Coefficient(
                n: 11,
                m: 8,
                kind: .g,
                values: [
                    1.1, 0.6,
                ]
            ),
            Coefficient(
                n: 11,
                m: 8,
                kind: .h,
                values: [
                    -1.7, -1.7,
                ]
            ),
            Coefficient(
                n: 11,
                m: 9,
                kind: .g,
                values: [
                    -1, -1.5,
                ]
            ),
            Coefficient(
                n: 11,
                m: 9,
                kind: .h,
                values: [
                    -2.9, -2.9,
                ]
            ),
            Coefficient(
                n: 11,
                m: 10,
                kind: .g,
                values: [
                    -0.2, -0.7,
                ]
            ),
            Coefficient(
                n: 11,
                m: 10,
                kind: .h,
                values: [
                    -1.8, -1.8,
                ]
            ),
            Coefficient(
                n: 11,
                m: 11,
                kind: .g,
                values: [
                    2.6, 2.1,
                ]
            ),
            Coefficient(
                n: 11,
                m: 11,
                kind: .h,
                values: [
                    -2.3, -2.3,
                ]
            ),
            Coefficient(
                n: 12,
                m: 0,
                kind: .g,
                values: [
                    -2, -2,
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
                    -1.3, -1.3,
                ]
            ),
            Coefficient(
                n: 12,
                m: 2,
                kind: .g,
                values: [
                    0.3, 0.3,
                ]
            ),
            Coefficient(
                n: 12,
                m: 2,
                kind: .h,
                values: [
                    0.7, 0.7,
                ]
            ),
            Coefficient(
                n: 12,
                m: 3,
                kind: .g,
                values: [
                    1.2, 1.2,
                ]
            ),
            Coefficient(
                n: 12,
                m: 3,
                kind: .h,
                values: [
                    1, 0.5,
                ]
            ),
            Coefficient(
                n: 12,
                m: 4,
                kind: .g,
                values: [
                    -1.3, -1.3,
                ]
            ),
            Coefficient(
                n: 12,
                m: 4,
                kind: .h,
                values: [
                    -1.4, -0.9,
                ]
            ),
            Coefficient(
                n: 12,
                m: 5,
                kind: .g,
                values: [
                    0.6, 0.6,
                ]
            ),
            Coefficient(
                n: 12,
                m: 5,
                kind: .h,
                values: [
                    -0, -0,
                ]
            ),
            Coefficient(
                n: 12,
                m: 6,
                kind: .g,
                values: [
                    0.6, 1.1,
                ]
            ),
            Coefficient(
                n: 12,
                m: 6,
                kind: .h,
                values: [
                    0.6, 0.6,
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
                    -0.1, -0.1,
                ]
            ),
            Coefficient(
                n: 12,
                m: 8,
                kind: .g,
                values: [
                    -0.1, -0.1,
                ]
            ),
            Coefficient(
                n: 12,
                m: 8,
                kind: .h,
                values: [
                    0.8, 0.8,
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
                    0.1, 0.1,
                ]
            ),
            Coefficient(
                n: 12,
                m: 10,
                kind: .g,
                values: [
                    -0.2, -0.7,
                ]
            ),
            Coefficient(
                n: 12,
                m: 10,
                kind: .h,
                values: [
                    -1, -1,
                ]
            ),
            Coefficient(
                n: 12,
                m: 11,
                kind: .g,
                values: [
                    -1.3, -1.3,
                ]
            ),
            Coefficient(
                n: 12,
                m: 11,
                kind: .h,
                values: [
                    0.1, 0.1,
                ]
            ),
            Coefficient(
                n: 12,
                m: 12,
                kind: .g,
                values: [
                    -0.7, -1.2,
                ]
            ),
            Coefficient(
                n: 12,
                m: 12,
                kind: .h,
                values: [
                    0.2, -0.3,
                ]
            ),
        ]
    )
}
