import Foundation

extension IGRFDocument {
  public static let model5 = IGRFDocument(
    fileName: "IGRF5.txt",
    headers: [
      "5th Generation International Geomagnetic Reference Field Schmidt semi-normalised spherical harmonic coefficients, degree n=1,13, Released 1987",
      "in units nanoTesla for IGRF and definitive DGRF main-field models (degree n=1,8 nanoTesla/year for secular variation (SV))",
      "see http://www.ngdc.noaa.gov/IAGA/vmod/igrf.html for detailed description",
    ],
    headerNumbers: [
      1, 13, 10, 2, 1, 1945.0, 1990.0,
    ],
    epochs: [
      1945.0, 1950.0, 1955.0, 1960.0, 1965.0, 1970.0, 1975.0, 1980.0,
      1985.0, 1990.0,
    ],
    coefficients: [
      IGRFCoefficient(
        n: 1,
        m: 0,
        kind: .g,
        values: [
          -30594, -30554, -30500, -30421, -30334, -30220, -30100, -29992,
          -29877, -29761.0,
        ]
      ),
      IGRFCoefficient(
        n: 1,
        m: 1,
        kind: .g,
        values: [
          -2285, -2250, -2215, -2169, -2119, -2068, -2013, -1956,
          -1903, -1853.0,
        ]
      ),
      IGRFCoefficient(
        n: 1,
        m: 1,
        kind: .h,
        values: [
          5810, 5815, 5820, 5791, 5776, 5737, 5675, 5604,
          5497, 5374.5,
        ]
      ),
      IGRFCoefficient(
        n: 2,
        m: 0,
        kind: .g,
        values: [
          -1244, -1341, -1440, -1555, -1662, -1781, -1902, -1997,
          -2073, -2141.5,
        ]
      ),
      IGRFCoefficient(
        n: 2,
        m: 1,
        kind: .g,
        values: [
          2990, 2998, 3003, 3002, 2997, 3000, 3010, 3027,
          3045, 3062.0,
        ]
      ),
      IGRFCoefficient(
        n: 2,
        m: 1,
        kind: .h,
        values: [
          -1702, -1810, -1898, -1967, -2016, -2047, -2067, -2129,
          -2191, -2248.5,
        ]
      ),
      IGRFCoefficient(
        n: 2,
        m: 2,
        kind: .g,
        values: [
          1578, 1576, 1581, 1590, 1594, 1611, 1632, 1663,
          1691, 1726.0,
        ]
      ),
      IGRFCoefficient(
        n: 2,
        m: 2,
        kind: .h,
        values: [
          477, 381, 291, 206, 114, 25, -68, -200,
          -309, -410.0,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 0,
        kind: .g,
        values: [
          1282, 1297, 1302, 1302, 1297, 1287, 1276, 1281,
          1300, 1325.5,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 1,
        kind: .g,
        values: [
          -1834, -1889, -1944, -1992, -2038, -2091, -2144, -2180,
          -2208, -2231.0,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 1,
        kind: .h,
        values: [
          -499, -476, -462, -414, -404, -366, -333, -336,
          -312, -285.5,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 2,
        kind: .g,
        values: [
          1255, 1274, 1288, 1289, 1292, 1278, 1260, 1251,
          1244, 1241.0,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 2,
        kind: .h,
        values: [
          186, 206, 216, 224, 240, 251, 262, 271,
          284, 295.5,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 3,
        kind: .g,
        values: [
          913, 896, 882, 878, 856, 838, 830, 833,
          835, 835.5,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 3,
        kind: .h,
        values: [
          -11, -46, -83, -130, -165, -196, -223, -252,
          -296, -350.0,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 0,
        kind: .g,
        values: [
          944, 954, 958, 957, 957, 952, 946, 938,
          937, 937.5,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 1,
        kind: .g,
        values: [
          776, 792, 796, 800, 804, 800, 791, 782,
          780, 777.0,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 1,
        kind: .h,
        values: [
          144, 136, 133, 135, 148, 167, 191, 212,
          233, 252.0,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 2,
        kind: .g,
        values: [
          544, 528, 510, 504, 479, 461, 438, 398,
          363, 324.0,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 2,
        kind: .h,
        values: [
          -276, -278, -274, -278, -269, -266, -265, -257,
          -250, -239.0,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 3,
        kind: .g,
        values: [
          -421, -408, -397, -394, -390, -395, -405, -419,
          -426, -433.0,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 3,
        kind: .h,
        values: [
          -55, -37, -23, 3, 13, 26, 39, 53,
          68, 80.5,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 4,
        kind: .g,
        values: [
          304, 303, 290, 269, 252, 234, 216, 199,
          169, 135.0,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 4,
        kind: .h,
        values: [
          -178, -210, -230, -255, -269, -279, -288, -297,
          -298, -293.5,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 0,
        kind: .g,
        values: [
          -253, -240, -229, -222, -219, -216, -218, -218,
          -215, -208.5,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 1,
        kind: .g,
        values: [
          346, 349, 360, 362, 358, 359, 356, 357,
          356, 356.5,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 1,
        kind: .h,
        values: [
          -12, 3, 15, 16, 19, 26, 31, 46,
          47, 47.5,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 2,
        kind: .g,
        values: [
          194, 211, 230, 242, 254, 262, 264, 261,
          253, 245.5,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 2,
        kind: .h,
        values: [
          95, 103, 110, 125, 128, 139, 148, 150,
          148, 147.0,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 3,
        kind: .g,
        values: [
          -20, -20, -23, -26, -31, -42, -59, -74,
          -94, -110.0,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 3,
        kind: .h,
        values: [
          -67, -87, -98, -117, -126, -139, -152, -151,
          -155, -155.5,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 4,
        kind: .g,
        values: [
          -142, -147, -152, -156, -157, -160, -159, -162,
          -161, -160.5,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 4,
        kind: .h,
        values: [
          -119, -122, -121, -114, -97, -91, -83, -78,
          -75, -72.0,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 5,
        kind: .g,
        values: [
          -82, -76, -69, -63, -62, -56, -49, -48,
          -48, -48.5,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 5,
        kind: .h,
        values: [
          82, 80, 78, 81, 81, 83, 88, 92,
          95, 95.0,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 0,
        kind: .g,
        values: [
          59, 54, 47, 46, 45, 43, 45, 48,
          52, 59.0,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 1,
        kind: .g,
        values: [
          57, 57, 57, 58, 61, 64, 66, 66,
          65, 63.5,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 1,
        kind: .h,
        values: [
          6, -1, -9, -10, -11, -12, -13, -15,
          -16, -18.0,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 2,
        kind: .g,
        values: [
          6, 4, 3, 1, 8, 15, 28, 42,
          50, 58.5,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 2,
        kind: .h,
        values: [
          100, 99, 96, 99, 100, 100, 99, 93,
          90, 84.5,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 3,
        kind: .g,
        values: [
          -246, -247, -247, -237, -228, -212, -198, -192,
          -186, -183.0,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 3,
        kind: .h,
        values: [
          16, 33, 48, 60, 68, 72, 75, 71,
          69, 65.0,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 4,
        kind: .g,
        values: [
          -25, -16, -8, -1, 4, 2, 1, 4,
          4, 4.0,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 4,
        kind: .h,
        values: [
          -9, -12, -16, -20, -32, -37, -41, -43,
          -50, -61.5,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 5,
        kind: .g,
        values: [
          21, 12, 7, -2, 1, 3, 6, 14,
          17, 21.5,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 5,
        kind: .h,
        values: [
          -16, -12, -12, -11, -8, -6, -4, -2,
          -4, -6.5,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 6,
        kind: .g,
        values: [
          -104, -105, -107, -113, -111, -112, -111, -108,
          -102, -96.0,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 6,
        kind: .h,
        values: [
          -39, -30, -24, -17, -7, 1, 11, 17,
          20, 19.5,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 0,
        kind: .g,
        values: [
          70, 65, 65, 67, 75, 72, 71, 72,
          75, 76.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 1,
        kind: .g,
        values: [
          -40, -55, -56, -56, -57, -57, -56, -59,
          -61, -64.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 1,
        kind: .h,
        values: [
          -45, -35, -50, -55, -61, -70, -77, -82,
          -82, -81.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 2,
        kind: .g,
        values: [
          0, 2, 2, 5, 4, 1, 1, 2,
          2, -0.5,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 2,
        kind: .h,
        values: [
          -18, -17, -24, -28, -27, -27, -26, -27,
          -26, -21.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 3,
        kind: .g,
        values: [
          0, 1, 10, 15, 13, 14, 16, 21,
          24, 28.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 3,
        kind: .h,
        values: [
          2, 0, -4, -6, -2, -4, -5, -5,
          -1, 4.5,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 4,
        kind: .g,
        values: [
          -29, -40, -32, -32, -26, -22, -14, -12,
          -6, -1.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 4,
        kind: .h,
        values: [
          6, 10, 8, 7, 6, 8, 10, 16,
          23, 32.5,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 5,
        kind: .g,
        values: [
          -10, -7, -11, -7, -6, -2, 0, 1,
          4, 6.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 5,
        kind: .h,
        values: [
          28, 36, 28, 23, 26, 23, 22, 18,
          17, 18.5,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 6,
        kind: .g,
        values: [
          15, 5, 9, 17, 13, 13, 12, 11,
          9, 6.5,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 6,
        kind: .h,
        values: [
          -17, -18, -20, -18, -23, -23, -23, -23,
          -21, -20.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 7,
        kind: .g,
        values: [
          29, 19, 18, 8, 1, -2, -5, -2,
          0, -0.5,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 7,
        kind: .h,
        values: [
          -22, -16, -18, -17, -12, -11, -12, -10,
          -6, -1.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 0,
        kind: .g,
        values: [
          13, 22, 11, 15, 13, 14, 14, 18,
          21, 24.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 1,
        kind: .g,
        values: [
          7, 15, 9, 6, 5, 6, 6, 6,
          6, 6.0,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 1,
        kind: .h,
        values: [
          12, 5, 10, 11, 7, 7, 6, 7,
          7, 7.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 2,
        kind: .g,
        values: [
          -8, -4, -6, -4, -4, -2, -1, 0,
          0, 1.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 2,
        kind: .h,
        values: [
          -21, -22, -15, -14, -12, -15, -16, -18,
          -21, -26.0,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 3,
        kind: .g,
        values: [
          -5, -1, -14, -11, -14, -13, -12, -11,
          -11, -9.0,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 3,
        kind: .h,
        values: [
          -12, 0, 5, 7, 9, 6, 4, 4,
          5, 5.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 4,
        kind: .g,
        values: [
          9, 11, 6, 2, 0, -3, -8, -7,
          -9, -10.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 4,
        kind: .h,
        values: [
          -7, -21, -23, -18, -16, -17, -19, -22,
          -25, -29.0,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 5,
        kind: .g,
        values: [
          7, 15, 10, 10, 8, 5, 4, 4,
          2, 0.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 5,
        kind: .h,
        values: [
          2, -8, 3, 4, 4, 6, 6, 9,
          11, 12.0,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 6,
        kind: .g,
        values: [
          -10, -13, -7, -5, -1, 0, 0, 3,
          4, 4.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 6,
        kind: .h,
        values: [
          18, 17, 23, 23, 24, 21, 18, 16,
          12, 8.0,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 7,
        kind: .g,
        values: [
          7, 5, 6, 10, 11, 11, 10, 6,
          4, 1.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 7,
        kind: .h,
        values: [
          3, -4, -4, 1, -3, -6, -10, -13,
          -16, -16.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 8,
        kind: .g,
        values: [
          2, -1, 9, 8, 4, 3, 1, -1,
          -6, -10.0,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 8,
        kind: .h,
        values: [
          -11, -17, -13, -20, -17, -16, -17, -15,
          -10, -3.5,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 0,
        kind: .g,
        values: [
          5, 3, 4, 4, 8, 8, 7, 5,
          5, 5,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 1,
        kind: .g,
        values: [
          -21, -7, 9, 6, 10, 10, 10, 10,
          10, 10,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 1,
        kind: .h,
        values: [
          -27, -24, -11, -18, -22, -21, -21, -21,
          -21, -21,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 2,
        kind: .g,
        values: [
          1, -1, -4, 0, 2, 2, 2, 1,
          1, 1,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 2,
        kind: .h,
        values: [
          17, 19, 12, 12, 15, 16, 16, 16,
          16, 16,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 3,
        kind: .g,
        values: [
          -11, -25, -5, -9, -13, -12, -12, -12,
          -12, -12,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 3,
        kind: .h,
        values: [
          29, 12, 7, 2, 7, 6, 7, 9,
          9, 9,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 4,
        kind: .g,
        values: [
          3, 10, 2, 1, 10, 10, 10, 9,
          9, 9,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 4,
        kind: .h,
        values: [
          -9, 2, 6, 0, -4, -4, -4, -5,
          -5, -5,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 5,
        kind: .g,
        values: [
          16, 5, 4, 4, -1, -1, -1, -3,
          -3, -3,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 5,
        kind: .h,
        values: [
          4, 2, -2, -3, -5, -5, -5, -6,
          -6, -6,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 6,
        kind: .g,
        values: [
          -3, -5, 1, -1, -1, 0, -1, -1,
          -1, -1,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 6,
        kind: .h,
        values: [
          9, 8, 10, 9, 10, 10, 10, 9,
          9, 9,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 7,
        kind: .g,
        values: [
          -4, -2, 2, -2, 5, 3, 4, 7,
          7, 7,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 7,
        kind: .h,
        values: [
          6, 8, 7, 8, 10, 11, 11, 10,
          10, 10,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 8,
        kind: .g,
        values: [
          -3, 3, 2, 3, 1, 1, 1, 2,
          2, 2,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 8,
        kind: .h,
        values: [
          1, -11, -6, 0, -4, -2, -3, -6,
          -6, -6,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 9,
        kind: .g,
        values: [
          -4, 8, 5, -1, -2, -1, -2, -5,
          -5, -5,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 9,
        kind: .h,
        values: [
          8, -7, 5, 5, 1, 1, 1, 2,
          2, 2,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 0,
        kind: .g,
        values: [
          -3, -8, -3, 1, -2, -3, -3, -4,
          -4, -4,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 1,
        kind: .g,
        values: [
          11, 4, -5, -3, -3, -3, -3, -4,
          -4, -4,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 1,
        kind: .h,
        values: [
          5, 13, -4, 4, 2, 1, 1, 1,
          1, 1,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 2,
        kind: .g,
        values: [
          1, -1, -1, 4, 2, 2, 2, 2,
          2, 2,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 2,
        kind: .h,
        values: [
          1, -2, 0, 1, 1, 1, 1, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 3,
        kind: .g,
        values: [
          2, 13, 2, 0, -5, -5, -5, -5,
          -5, -5,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 3,
        kind: .h,
        values: [
          -20, -10, -8, 0, 2, 3, 3, 3,
          3, 3,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 4,
        kind: .g,
        values: [
          -5, -4, -3, -1, -2, -1, -2, -2,
          -2, -2,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 4,
        kind: .h,
        values: [
          -1, 2, -2, 2, 6, 4, 4, 6,
          6, 6,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 5,
        kind: .g,
        values: [
          -1, 4, 7, 4, 4, 6, 5, 5,
          5, 5,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 5,
        kind: .h,
        values: [
          -6, -3, -4, -5, -4, -4, -4, -4,
          -4, -4,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 6,
        kind: .g,
        values: [
          8, 12, 4, 6, 4, 4, 4, 3,
          3, 3,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 6,
        kind: .h,
        values: [
          6, 6, 1, 1, 0, 0, -1, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 7,
        kind: .g,
        values: [
          -1, 3, -2, 1, 0, 1, 1, 1,
          1, 1,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 7,
        kind: .h,
        values: [
          -4, -3, -3, -1, -2, -1, -1, -1,
          -1, -1,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 8,
        kind: .g,
        values: [
          -3, 2, 6, -1, 2, 0, 0, 2,
          2, 2,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 8,
        kind: .h,
        values: [
          -2, 6, 7, 6, 3, 3, 3, 4,
          4, 4,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 9,
        kind: .g,
        values: [
          5, 10, -2, 2, 2, 3, 3, 3,
          3, 3,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 9,
        kind: .h,
        values: [
          0, 11, -1, 0, 0, 1, 1, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 10,
        kind: .g,
        values: [
          -2, 3, 0, 0, 0, -1, -1, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 10,
        kind: .h,
        values: [
          -2, 8, -3, -7, -6, -4, -5, -6,
          -6, -6,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 0,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 1,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 1,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 2,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 2,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 3,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 3,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 4,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 4,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 5,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 5,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 6,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 6,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 7,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 7,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 8,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 8,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 9,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 9,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 10,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 10,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 11,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 11,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 0,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 1,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 1,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 2,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 2,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 3,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 3,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 4,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 4,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 5,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 5,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 6,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 6,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 7,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 7,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 8,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 8,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 9,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 9,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 10,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 10,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 11,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 11,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 12,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 12,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 0,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 1,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 1,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 2,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 2,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 3,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 3,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 4,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 4,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 5,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 5,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 6,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 6,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 7,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 7,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 8,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 8,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 9,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 9,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 10,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 10,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 11,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 11,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 12,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 12,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 13,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 13,
        kind: .h,
        values: [
          0, 0, 0, 0, 0, 0, 0, 0,
          0, 0,
        ]
      ),
    ]
  )
}
