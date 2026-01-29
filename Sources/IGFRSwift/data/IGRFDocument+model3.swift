import Foundation

extension IGRFDocument {
  public static let model3 = IGRFDocument(
    fileName: "IGRF3.txt",
    headers: [
      "3rd Generation International Geomagnetic Reference Field Schmidt semi-normalised spherical harmonic coefficients, degree n=1,13, Released 1981",
      "in units nanoTesla for IGRF and definitive DGRF main-field models (degree n=1,8 nanoTesla/year for secular variation (SV))",
      "see http://www.ngdc.noaa.gov/IAGA/vmod/igrf.html for detailed description",
    ],
    headerNumbers: [
      1, 13, 5, 2, 1, 1965.0, 1985.0,
    ],
    epochs: [
      1965.0, 1970.0, 1975.0, 1980.0, 1985.0,
    ],
    coefficients: [
      IGRFCoefficient(
        n: 1,
        m: 0,
        kind: .g,
        values: [
          -30334, -30220, -30100, -29988, -29876.0,
        ]
      ),
      IGRFCoefficient(
        n: 1,
        m: 1,
        kind: .g,
        values: [
          -2119, -2068, -2013, -1957, -1900.5,
        ]
      ),
      IGRFCoefficient(
        n: 1,
        m: 1,
        kind: .h,
        values: [
          5776, 5737, 5675, 5606, 5526.5,
        ]
      ),
      IGRFCoefficient(
        n: 2,
        m: 0,
        kind: .g,
        values: [
          -1662, -1781, -1902, -1997, -2088.5,
        ]
      ),
      IGRFCoefficient(
        n: 2,
        m: 1,
        kind: .g,
        values: [
          2997, 3000, 3010, 3028, 3044.0,
        ]
      ),
      IGRFCoefficient(
        n: 2,
        m: 1,
        kind: .h,
        values: [
          -2016, -2047, -2067, -2129, -2192.5,
        ]
      ),
      IGRFCoefficient(
        n: 2,
        m: 2,
        kind: .g,
        values: [
          1594, 1611, 1632, 1662, 1697.0,
        ]
      ),
      IGRFCoefficient(
        n: 2,
        m: 2,
        kind: .h,
        values: [
          114, 25, -68, -199, -325.0,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 0,
        kind: .g,
        values: [
          1297, 1287, 1276, 1279, 1279.0,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 1,
        kind: .g,
        values: [
          -2038, -2091, -2144, -2181, -2213.5,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 1,
        kind: .h,
        values: [
          -404, -366, -333, -335, -334.0,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 2,
        kind: .g,
        values: [
          1292, 1278, 1260, 1251, 1247.5,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 2,
        kind: .h,
        values: [
          240, 251, 262, 271, 284.5,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 3,
        kind: .g,
        values: [
          856, 838, 830, 833, 838.0,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 3,
        kind: .h,
        values: [
          -165, -196, -223, -252, -291.5,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 0,
        kind: .g,
        values: [
          957, 952, 946, 938, 931.0,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 1,
        kind: .g,
        values: [
          804, 800, 791, 783, 776.0,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 1,
        kind: .h,
        values: [
          148, 167, 191, 212, 235.0,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 2,
        kind: .g,
        values: [
          479, 461, 438, 398, 357.0,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 2,
        kind: .h,
        values: [
          -269, -266, -265, -257, -249.0,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 3,
        kind: .g,
        values: [
          -390, -395, -405, -419, -428.0,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 3,
        kind: .h,
        values: [
          13, 26, 39, 53, 67.5,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 4,
        kind: .g,
        values: [
          252, 234, 216, 199, 174.0,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 4,
        kind: .h,
        values: [
          -269, -279, -288, -298, -296.0,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 0,
        kind: .g,
        values: [
          -219, -216, -218, -219, -211.5,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 1,
        kind: .g,
        values: [
          358, 359, 356, 357, 359.0,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 1,
        kind: .h,
        values: [
          19, 26, 31, 46, 55.0,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 2,
        kind: .g,
        values: [
          254, 262, 264, 261, 257.0,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 2,
        kind: .h,
        values: [
          128, 139, 148, 149, 147.0,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 3,
        kind: .g,
        values: [
          -31, -42, -59, -74, -90.5,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 3,
        kind: .h,
        values: [
          -126, -139, -152, -150, -150.0,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 4,
        kind: .g,
        values: [
          -157, -160, -159, -162, -161.0,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 4,
        kind: .h,
        values: [
          -97, -91, -83, -78, -71.5,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 5,
        kind: .g,
        values: [
          -62, -56, -49, -48, -41.0,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 5,
        kind: .h,
        values: [
          81, 83, 88, 92, 102.5,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 0,
        kind: .g,
        values: [
          45, 43, 45, 49, 51.0,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 1,
        kind: .g,
        values: [
          61, 64, 66, 65, 65.0,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 1,
        kind: .h,
        values: [
          -11, -12, -13, -15, -17.5,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 2,
        kind: .g,
        values: [
          8, 15, 28, 42, 59.0,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 2,
        kind: .h,
        values: [
          100, 100, 99, 93, 86.0,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 3,
        kind: .g,
        values: [
          -228, -212, -198, -192, -188.0,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 3,
        kind: .h,
        values: [
          68, 72, 75, 71, 71.0,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 4,
        kind: .g,
        values: [
          4, 2, 1, 4, 8.0,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 4,
        kind: .h,
        values: [
          -32, -37, -41, -43, -51.0,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 5,
        kind: .g,
        values: [
          1, 3, 6, 14, 15.5,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 5,
        kind: .h,
        values: [
          -8, -6, -4, -2, 0.5,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 6,
        kind: .g,
        values: [
          -111, -112, -111, -108, -108.5,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 6,
        kind: .h,
        values: [
          -7, 1, 11, 17, 17.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 0,
        kind: .g,
        values: [
          75, 72, 71, 70, 65.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 1,
        kind: .g,
        values: [
          -57, -57, -56, -59, -63.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 1,
        kind: .h,
        values: [
          -61, -70, -77, -83, -85.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 2,
        kind: .g,
        values: [
          4, 1, 1, 2, 4.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 2,
        kind: .h,
        values: [
          -27, -27, -26, -28, -26.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 3,
        kind: .g,
        values: [
          13, 14, 16, 20, 22.5,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 3,
        kind: .h,
        values: [
          -2, -4, -5, -5, -4.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 4,
        kind: .g,
        values: [
          -26, -22, -14, -13, -5.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 4,
        kind: .h,
        values: [
          6, 8, 10, 16, 23.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 5,
        kind: .g,
        values: [
          -6, -2, 0, 1, 1.5,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 5,
        kind: .h,
        values: [
          26, 23, 22, 18, 15.5,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 6,
        kind: .g,
        values: [
          13, 13, 12, 11, 11.5,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 6,
        kind: .h,
        values: [
          -23, -23, -23, -23, -23.5,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 7,
        kind: .g,
        values: [
          1, -2, -5, -2, -2.0,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 7,
        kind: .h,
        values: [
          -12, -11, -12, -10, -4.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 0,
        kind: .g,
        values: [
          13, 14, 14, 20, 24.0,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 1,
        kind: .g,
        values: [
          5, 6, 6, 7, 6.0,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 1,
        kind: .h,
        values: [
          7, 7, 6, 7, 6.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 2,
        kind: .g,
        values: [
          -4, -2, -1, 1, -0.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 2,
        kind: .h,
        values: [
          -12, -15, -16, -18, -21.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 3,
        kind: .g,
        values: [
          -14, -13, -12, -11, -9.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 3,
        kind: .h,
        values: [
          9, 6, 4, 4, 4.0,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 4,
        kind: .g,
        values: [
          0, -3, -8, -7, -11.0,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 4,
        kind: .h,
        values: [
          -16, -17, -19, -22, -26.0,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 5,
        kind: .g,
        values: [
          8, 5, 4, 4, 3.0,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 5,
        kind: .h,
        values: [
          4, 6, 6, 9, 10.0,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 6,
        kind: .g,
        values: [
          -1, 0, 0, 3, 6.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 6,
        kind: .h,
        values: [
          24, 21, 18, 16, 17.0,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 7,
        kind: .g,
        values: [
          11, 11, 10, 7, 5.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 7,
        kind: .h,
        values: [
          -3, -6, -10, -13, -18.5,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 8,
        kind: .g,
        values: [
          4, 3, 1, -1, 5.0,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 8,
        kind: .h,
        values: [
          -17, -16, -17, -15, -11.0,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 0,
        kind: .g,
        values: [
          8, 8, 7, 6, 6,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 1,
        kind: .g,
        values: [
          10, 10, 10, 11, 11,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 1,
        kind: .h,
        values: [
          -22, -21, -21, -21, -21,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 2,
        kind: .g,
        values: [
          2, 2, 2, 2, 2,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 2,
        kind: .h,
        values: [
          15, 16, 16, 16, 16,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 3,
        kind: .g,
        values: [
          -13, -12, -12, -12, -12,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 3,
        kind: .h,
        values: [
          7, 6, 7, 9, 9,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 4,
        kind: .g,
        values: [
          10, 10, 10, 9, 9,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 4,
        kind: .h,
        values: [
          -4, -4, -4, -5, -5,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 5,
        kind: .g,
        values: [
          -1, -1, -1, -3, -3,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 5,
        kind: .h,
        values: [
          -5, -5, -5, -7, -7,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 6,
        kind: .g,
        values: [
          -1, 0, -1, -1, -1,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 6,
        kind: .h,
        values: [
          10, 10, 10, 9, 9,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 7,
        kind: .g,
        values: [
          5, 3, 4, 7, 7,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 7,
        kind: .h,
        values: [
          10, 11, 11, 10, 10,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 8,
        kind: .g,
        values: [
          1, 1, 1, 1, 1,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 8,
        kind: .h,
        values: [
          -4, -2, -3, -6, -6,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 9,
        kind: .g,
        values: [
          -2, -1, -2, -5, -5,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 9,
        kind: .h,
        values: [
          1, 1, 1, 2, 2,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 0,
        kind: .g,
        values: [
          -2, -3, -3, -3, -3,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 1,
        kind: .g,
        values: [
          -3, -3, -3, -4, -4,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 1,
        kind: .h,
        values: [
          2, 1, 1, 1, 1,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 2,
        kind: .g,
        values: [
          2, 2, 2, 2, 2,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 2,
        kind: .h,
        values: [
          1, 1, 1, 1, 1,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 3,
        kind: .g,
        values: [
          -5, -5, -5, -5, -5,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 3,
        kind: .h,
        values: [
          2, 3, 3, 2, 2,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 4,
        kind: .g,
        values: [
          -2, -1, -2, -2, -2,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 4,
        kind: .h,
        values: [
          6, 4, 4, 5, 5,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 5,
        kind: .g,
        values: [
          4, 6, 5, 5, 5,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 5,
        kind: .h,
        values: [
          -4, -4, -4, -4, -4,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 6,
        kind: .g,
        values: [
          4, 4, 4, 3, 3,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 6,
        kind: .h,
        values: [
          0, 0, -1, -1, -1,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 7,
        kind: .g,
        values: [
          0, 1, 1, 1, 1,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 7,
        kind: .h,
        values: [
          -2, -1, -1, -2, -2,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 8,
        kind: .g,
        values: [
          2, 0, 0, 2, 2,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 8,
        kind: .h,
        values: [
          3, 3, 3, 4, 4,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 9,
        kind: .g,
        values: [
          2, 3, 3, 3, 3,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 9,
        kind: .h,
        values: [
          0, 1, 1, -1, -1,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 10,
        kind: .g,
        values: [
          0, -1, -1, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 10,
        kind: .h,
        values: [
          -6, -4, -5, -6, -6,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 0,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 1,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 1,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 2,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 2,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 3,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 3,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 4,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 4,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 5,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 5,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 6,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 6,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 7,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 7,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 8,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 8,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 9,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 9,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 10,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 10,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 11,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 11,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 0,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 1,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 1,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 2,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 2,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 3,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 3,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 4,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 4,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 5,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 5,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 6,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 6,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 7,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 7,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 8,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 8,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 9,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 9,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 10,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 10,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 11,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 11,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 12,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 12,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 0,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 1,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 1,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 2,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 2,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 3,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 3,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 4,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 4,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 5,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 5,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 6,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 6,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 7,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 7,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 8,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 8,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 9,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 9,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 10,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 10,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 11,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 11,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 12,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 12,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 13,
        kind: .g,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 13,
        kind: .h,
        values: [
          0, 0, 0, 0, 0,
        ]
      ),
    ]
  )
}
