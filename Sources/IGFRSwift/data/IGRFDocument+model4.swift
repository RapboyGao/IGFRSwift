import Foundation

extension IGRFDocument {
  public static let model4 = IGRFDocument(
    fileName: "IGRF4.txt",
    headers: [
      "4th Generation International Geomagnetic Reference Field Schmidt semi-normalised spherical harmonic coefficients, degree n=1,13, Released 1985",
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
          -30634, -30571, -30507, -30411, -30334, -30220, -30100, -29992,
          -29877, -29761.0,
        ]
      ),
      IGRFCoefficient(
        n: 1,
        m: 1,
        kind: .g,
        values: [
          -2240, -2241, -2134, -2162, -2119, -2068, -2013, -1956,
          -1903, -1853.0,
        ]
      ),
      IGRFCoefficient(
        n: 1,
        m: 1,
        kind: .h,
        values: [
          5806, 5807, 5796, 5780, 5776, 5737, 5675, 5604,
          5497, 5374.5,
        ]
      ),
      IGRFCoefficient(
        n: 2,
        m: 0,
        kind: .g,
        values: [
          -1215, -1330, -1432, -1546, -1662, -1781, -1902, -1997,
          -2073, -2141.5,
        ]
      ),
      IGRFCoefficient(
        n: 2,
        m: 1,
        kind: .g,
        values: [
          2972, 2978, 2995, 3007, 2997, 3000, 3010, 3027,
          3045, 3062.0,
        ]
      ),
      IGRFCoefficient(
        n: 2,
        m: 1,
        kind: .h,
        values: [
          -1700, -1813, -1896, -1948, -2016, -2047, -2067, -2129,
          -2191, -2248.5,
        ]
      ),
      IGRFCoefficient(
        n: 2,
        m: 2,
        kind: .g,
        values: [
          1588, 1579, 1567, 1572, 1594, 1611, 1632, 1663,
          1691, 1726.0,
        ]
      ),
      IGRFCoefficient(
        n: 2,
        m: 2,
        kind: .h,
        values: [
          497, 388, 263, 209, 114, 25, -68, -200,
          -309, -410.0,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 0,
        kind: .g,
        values: [
          1274, 1293, 1308, 1307, 1297, 1287, 1276, 1281,
          1300, 1325.5,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 1,
        kind: .g,
        values: [
          -1833, -1878, -1955, -1987, -2038, -2091, -2144, -2180,
          -2208, -2231.0,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 1,
        kind: .h,
        values: [
          -512, -485, -487, -421, -404, -366, -333, -336,
          -312, -285.5,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 2,
        kind: .g,
        values: [
          1225, 1271, 1293, 1288, 1292, 1278, 1260, 1251,
          1244, 1241.0,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 2,
        kind: .h,
        values: [
          185, 228, 235, 230, 240, 251, 262, 271,
          284, 295.5,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 3,
        kind: .g,
        values: [
          926, 890, 897, 879, 856, 838, 830, 833,
          835, 835.5,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 3,
        kind: .h,
        values: [
          -5, -67, -73, -130, -165, -196, -223, -252,
          -296, -350.0,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 0,
        kind: .g,
        values: [
          980, 975, 964, 962, 957, 952, 946, 938,
          937, 937.5,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 1,
        kind: .g,
        values: [
          771, 795, 794, 804, 804, 800, 791, 782,
          780, 777.0,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 1,
        kind: .h,
        values: [
          155, 171, 167, 150, 148, 167, 191, 212,
          233, 252.0,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 2,
        kind: .g,
        values: [
          544, 532, 510, 492, 479, 461, 438, 398,
          363, 324.0,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 2,
        kind: .h,
        values: [
          -280, -306, -275, -272, -269, -266, -265, -257,
          -250, -239.0,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 3,
        kind: .g,
        values: [
          -408, -402, -392, -392, -390, -395, -405, -419,
          -426, -433.0,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 3,
        kind: .h,
        values: [
          -68, -51, -44, 1, 13, 26, 39, 53,
          68, 80.5,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 4,
        kind: .g,
        values: [
          300, 310, 292, 267, 252, 234, 216, 199,
          169, 135.0,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 4,
        kind: .h,
        values: [
          -158, -184, -249, -254, -269, -279, -288, -297,
          -298, -293.5,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 0,
        kind: .g,
        values: [
          -286, -255, -232, -236, -219, -216, -218, -218,
          -215, -208.5,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 1,
        kind: .g,
        values: [
          341, 355, 360, 358, 358, 359, 356, 357,
          356, 356.5,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 1,
        kind: .h,
        values: [
          -14, -8, 14, 12, 19, 26, 31, 46,
          47, 47.5,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 2,
        kind: .g,
        values: [
          207, 201, 237, 229, 254, 262, 264, 261,
          253, 245.5,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 2,
        kind: .h,
        values: [
          80, 101, 111, 121, 128, 139, 148, 150,
          148, 147.0,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 3,
        kind: .g,
        values: [
          -25, -3, -13, -34, -31, -42, -59, -74,
          -94, -110.0,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 3,
        kind: .h,
        values: [
          -65, -95, -90, -115, -126, -139, -152, -151,
          -155, -155.5,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 4,
        kind: .g,
        values: [
          -156, -160, -176, -153, -157, -160, -159, -162,
          -161, -160.5,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 4,
        kind: .h,
        values: [
          -114, -100, -111, -106, -97, -91, -83, -78,
          -75, -72.0,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 5,
        kind: .g,
        values: [
          -88, -76, -68, -64, -62, -56, -49, -48,
          -48, -48.5,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 5,
        kind: .h,
        values: [
          83, 73, 77, 83, 81, 83, 88, 92,
          95, 95.0,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 0,
        kind: .g,
        values: [
          68, 57, 47, 47, 45, 43, 45, 48,
          52, 59.0,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 1,
        kind: .g,
        values: [
          67, 50, 57, 56, 61, 64, 66, 66,
          65, 63.5,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 1,
        kind: .h,
        values: [
          9, -1, -7, -13, -11, -12, -13, -15,
          -16, -18.0,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 2,
        kind: .g,
        values: [
          6, 15, 4, -3, 8, 15, 28, 42,
          50, 58.5,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 2,
        kind: .h,
        values: [
          118, 100, 101, 106, 100, 100, 99, 93,
          90, 84.5,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 3,
        kind: .g,
        values: [
          -244, -261, -250, -241, -228, -212, -198, -192,
          -186, -183.0,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 3,
        kind: .h,
        values: [
          18, 52, 46, 55, 68, 72, 75, 71,
          69, 65.0,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 4,
        kind: .g,
        values: [
          -12, 8, 12, 3, 4, 2, 1, 4,
          4, 4.0,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 4,
        kind: .h,
        values: [
          -9, -7, -16, -26, -32, -37, -41, -43,
          -50, -61.5,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 5,
        kind: .g,
        values: [
          14, 8, 13, 4, 1, 3, 6, 14,
          17, 21.5,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 5,
        kind: .h,
        values: [
          -12, -17, -6, -10, -8, -6, -4, -2,
          -4, -6.5,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 6,
        kind: .g,
        values: [
          -100, -108, -105, -108, -111, -112, -111, -108,
          -102, -96.0,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 6,
        kind: .h,
        values: [
          -42, -21, -21, -16, -7, 1, 11, 17,
          20, 19.5,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 0,
        kind: .g,
        values: [
          72, 67, 80, 72, 75, 72, 71, 72,
          75, 76.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 1,
        kind: .g,
        values: [
          -61, -48, -66, -52, -57, -57, -56, -59,
          -61, -64.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 1,
        kind: .h,
        values: [
          -42, -44, -52, -53, -61, -70, -77, -82,
          -82, -81.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 2,
        kind: .g,
        values: [
          6, -3, 2, 4, 4, 1, 1, 2,
          2, -0.5,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 2,
        kind: .h,
        values: [
          -39, -18, -37, -25, -27, -27, -26, -27,
          -26, -21.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 3,
        kind: .g,
        values: [
          6, 16, 4, 11, 13, 14, 16, 21,
          24, 28.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 3,
        kind: .h,
        values: [
          2, -6, 6, -8, -2, -4, -5, -5,
          -1, 4.5,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 4,
        kind: .g,
        values: [
          -44, -38, -46, -20, -26, -22, -14, -12,
          -6, -1.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 4,
        kind: .h,
        values: [
          -1, -8, -1, 3, 6, 8, 10, 16,
          23, 32.5,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 5,
        kind: .g,
        values: [
          -2, 1, -15, -4, -6, -2, 0, 1,
          4, 6.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 5,
        kind: .h,
        values: [
          25, 32, 29, 28, 26, 23, 22, 18,
          17, 18.5,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 6,
        kind: .g,
        values: [
          18, 9, 8, 15, 13, 13, 12, 11,
          9, 6.5,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 6,
        kind: .h,
        values: [
          -19, -18, -20, -16, -23, -23, -23, -23,
          -21, -20.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 7,
        kind: .g,
        values: [
          27, 11, 14, 6, 1, -2, -5, -2,
          0, -0.5,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 7,
        kind: .h,
        values: [
          -23, -22, -12, -18, -12, -11, -12, -10,
          -6, -1.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 0,
        kind: .g,
        values: [
          15, 16, 5, 6, 13, 14, 14, 18,
          21, 24.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 1,
        kind: .g,
        values: [
          5, 4, 17, 4, 5, 6, 6, 6,
          6, 6.0,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 1,
        kind: .h,
        values: [
          -7, 2, 12, 7, 7, 7, 6, 7,
          7, 7.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 2,
        kind: .g,
        values: [
          -12, -8, -3, -3, -4, -2, -1, 0,
          0, 1.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 2,
        kind: .h,
        values: [
          9, -2, 1, -16, -12, -15, -16, -18,
          -21, -26.0,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 3,
        kind: .g,
        values: [
          -21, -31, -30, -13, -14, -13, -12, -11,
          -11, -9.0,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 3,
        kind: .h,
        values: [
          0, -3, 10, 5, 9, 6, 4, 4,
          5, 5.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 4,
        kind: .g,
        values: [
          18, 15, 14, -5, 0, -3, -8, -7,
          -9, -10.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 4,
        kind: .h,
        values: [
          -13, -7, -20, -19, -16, -17, -19, -22,
          -25, -29.0,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 5,
        kind: .g,
        values: [
          16, 8, 27, 10, 8, 5, 4, 4,
          2, 0.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 5,
        kind: .h,
        values: [
          5, 6, 5, 5, 4, 6, 6, 9,
          11, 12.0,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 6,
        kind: .g,
        values: [
          -14, -17, -15, -6, -1, 0, 0, 3,
          4, 4.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 6,
        kind: .h,
        values: [
          26, 27, 34, 23, 24, 21, 18, 16,
          12, 8.0,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 7,
        kind: .g,
        values: [
          1, 7, 1, 15, 11, 11, 10, 6,
          4, 1.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 7,
        kind: .h,
        values: [
          1, -6, 4, -2, -3, -6, -10, -13,
          -16, -16.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 8,
        kind: .g,
        values: [
          10, 13, 12, 5, 4, 3, 1, -1,
          -6, -10.0,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 8,
        kind: .h,
        values: [
          -19, -22, -19, -18, -17, -16, -17, -15,
          -10, -3.5,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 0,
        kind: .g,
        values: [
          0, 0, 0, 13, 8, 8, 7, 5,
          5, 5,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 1,
        kind: .g,
        values: [
          0, 0, 0, 5, 10, 10, 10, 10,
          10, 10,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 1,
        kind: .h,
        values: [
          0, 0, 0, -22, -22, -21, -21, -21,
          -21, -21,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 2,
        kind: .g,
        values: [
          0, 0, 0, 4, 2, 2, 2, 1,
          1, 1,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 2,
        kind: .h,
        values: [
          0, 0, 0, 14, 15, 16, 16, 16,
          16, 16,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 3,
        kind: .g,
        values: [
          0, 0, 0, -12, -13, -12, -12, -12,
          -12, -12,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 3,
        kind: .h,
        values: [
          0, 0, 0, 5, 7, 6, 7, 9,
          9, 9,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 4,
        kind: .g,
        values: [
          0, 0, 0, 14, 10, 10, 10, 9,
          9, 9,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 4,
        kind: .h,
        values: [
          0, 0, 0, -5, -4, -4, -4, -5,
          -5, -5,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 5,
        kind: .g,
        values: [
          0, 0, 0, 5, -1, -1, -1, -3,
          -3, -3,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 5,
        kind: .h,
        values: [
          0, 0, 0, 0, -5, -5, -5, -6,
          -6, -6,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 6,
        kind: .g,
        values: [
          0, 0, 0, -2, -1, 0, -1, -1,
          -1, -1,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 6,
        kind: .h,
        values: [
          0, 0, 0, 11, 10, 10, 10, 9,
          9, 9,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 7,
        kind: .g,
        values: [
          0, 0, 0, 0, 5, 3, 4, 7,
          7, 7,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 7,
        kind: .h,
        values: [
          0, 0, 0, 10, 10, 11, 11, 10,
          10, 10,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 8,
        kind: .g,
        values: [
          0, 0, 0, 0, 1, 1, 1, 2,
          2, 2,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 8,
        kind: .h,
        values: [
          0, 0, 0, 2, -4, -2, -3, -6,
          -6, -6,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 9,
        kind: .g,
        values: [
          0, 0, 0, -1, -2, -1, -2, -5,
          -5, -5,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 9,
        kind: .h,
        values: [
          0, 0, 0, -2, 1, 1, 1, 2,
          2, 2,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 0,
        kind: .g,
        values: [
          0, 0, 0, -5, -2, -3, -3, -4,
          -4, -4,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 1,
        kind: .g,
        values: [
          0, 0, 0, -2, -3, -3, -3, -4,
          -4, -4,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 1,
        kind: .h,
        values: [
          0, 0, 0, 3, 2, 1, 1, 1,
          1, 1,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 2,
        kind: .g,
        values: [
          0, 0, 0, 0, 2, 2, 2, 2,
          2, 2,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 2,
        kind: .h,
        values: [
          0, 0, 0, 0, 1, 1, 1, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 3,
        kind: .g,
        values: [
          0, 0, 0, -5, -5, -5, -5, -5,
          -5, -5,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 3,
        kind: .h,
        values: [
          0, 0, 0, 4, 2, 3, 3, 3,
          3, 3,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 4,
        kind: .g,
        values: [
          0, 0, 0, -2, -2, -1, -2, -2,
          -2, -2,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 4,
        kind: .h,
        values: [
          0, 0, 0, 3, 6, 4, 4, 6,
          6, 6,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 5,
        kind: .g,
        values: [
          0, 0, 0, 8, 4, 6, 5, 5,
          5, 5,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 5,
        kind: .h,
        values: [
          0, 0, 0, -4, -4, -4, -4, -4,
          -4, -4,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 6,
        kind: .g,
        values: [
          0, 0, 0, 3, 4, 4, 4, 3,
          3, 3,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 6,
        kind: .h,
        values: [
          0, 0, 0, -2, 0, 0, -1, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 7,
        kind: .g,
        values: [
          0, 0, 0, 0, 0, 1, 1, 1,
          1, 1,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 7,
        kind: .h,
        values: [
          0, 0, 0, -3, -2, -1, -1, -1,
          -1, -1,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 8,
        kind: .g,
        values: [
          0, 0, 0, 1, 2, 0, 0, 2,
          2, 2,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 8,
        kind: .h,
        values: [
          0, 0, 0, 5, 3, 3, 3, 4,
          4, 4,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 9,
        kind: .g,
        values: [
          0, 0, 0, 0, 2, 3, 3, 3,
          3, 3,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 9,
        kind: .h,
        values: [
          0, 0, 0, 3, 0, 1, 1, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 10,
        kind: .g,
        values: [
          0, 0, 0, -1, 0, -1, -1, 0,
          0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 10,
        kind: .h,
        values: [
          0, 0, 0, -3, -6, -4, -5, -6,
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
