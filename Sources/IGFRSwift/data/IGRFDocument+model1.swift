import Foundation

extension IGRFDocument {
  public static let model1 = IGRFDocument(
    fileName: "IGRF1.txt",
    headers: [
      "1st Generation International Geomagnetic Reference Field Schmidt semi-normalised spherical harmonic coefficients, degree n=1,8, Released 1968",
      "in units nanoTesla for IGRF and definitive DGRF main-field models (degree n=1,8 nanoTesla/year for secular variation (SV))",
      "see http://www.ngdc.noaa.gov/IAGA/vmod/igrf.html for detailed description",
    ],
    headerNumbers: [
      1, 13, 3, 2, 1, 1965.0, 1975.0,
    ],
    epochs: [
      1965, 1970, 1975,
    ],
    coefficients: [
      IGRFCoefficient(
        n: 1,
        m: 0,
        kind: .g,
        values: [
          -30339, -30263, -30186,
        ]
      ),
      IGRFCoefficient(
        n: 1,
        m: 1,
        kind: .g,
        values: [
          -2123, -2080, -2036,
        ]
      ),
      IGRFCoefficient(
        n: 1,
        m: 1,
        kind: .h,
        values: [
          5758, 5737, 5715,
        ]
      ),
      IGRFCoefficient(
        n: 2,
        m: 0,
        kind: .g,
        values: [
          -1654, -1632, -1610,
        ]
      ),
      IGRFCoefficient(
        n: 2,
        m: 1,
        kind: .g,
        values: [
          2994, 2993, 2991,
        ]
      ),
      IGRFCoefficient(
        n: 2,
        m: 1,
        kind: .h,
        values: [
          -2006, -1947, -1888,
        ]
      ),
      IGRFCoefficient(
        n: 2,
        m: 2,
        kind: .g,
        values: [
          1567, 1559, 1551,
        ]
      ),
      IGRFCoefficient(
        n: 2,
        m: 2,
        kind: .h,
        values: [
          130, 47, -37,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 0,
        kind: .g,
        values: [
          1297, 1298, 1299,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 1,
        kind: .g,
        values: [
          -2036, -2090, -2144,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 1,
        kind: .h,
        values: [
          -403, -382, -361,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 2,
        kind: .g,
        values: [
          1289, 1293, 1296,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 2,
        kind: .h,
        values: [
          242, 246, 249,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 3,
        kind: .g,
        values: [
          843, 824, 805,
        ]
      ),
      IGRFCoefficient(
        n: 3,
        m: 3,
        kind: .h,
        values: [
          -176, -215, -253,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 0,
        kind: .g,
        values: [
          958, 955, 951,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 1,
        kind: .g,
        values: [
          805, 806, 807,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 1,
        kind: .h,
        values: [
          149, 149, 148,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 2,
        kind: .g,
        values: [
          492, 477, 462,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 2,
        kind: .h,
        values: [
          -280, -272, -264,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 3,
        kind: .g,
        values: [
          -392, -393, -393,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 3,
        kind: .h,
        values: [
          8, 23, 37,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 4,
        kind: .g,
        values: [
          256, 246, 235,
        ]
      ),
      IGRFCoefficient(
        n: 4,
        m: 4,
        kind: .h,
        values: [
          -265, -286, -307,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 0,
        kind: .g,
        values: [
          -223, -214, -204,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 1,
        kind: .g,
        values: [
          357, 363, 368,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 1,
        kind: .h,
        values: [
          16, 28, 39,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 2,
        kind: .g,
        values: [
          246, 261, 275,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 2,
        kind: .h,
        values: [
          125, 134, 142,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 3,
        kind: .g,
        values: [
          -26, -23, -20,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 3,
        kind: .h,
        values: [
          -123, -135, -147,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 4,
        kind: .g,
        values: [
          -161, -161, -161,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 4,
        kind: .h,
        values: [
          -107, -103, -99,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 5,
        kind: .g,
        values: [
          -51, -45, -38,
        ]
      ),
      IGRFCoefficient(
        n: 5,
        m: 5,
        kind: .h,
        values: [
          77, 76, 74,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 0,
        kind: .g,
        values: [
          47, 47, 46,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 1,
        kind: .g,
        values: [
          60, 59, 57,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 1,
        kind: .h,
        values: [
          -14, -19, -23,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 2,
        kind: .g,
        values: [
          4, 10, 15,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 2,
        kind: .h,
        values: [
          106, 104, 102,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 3,
        kind: .g,
        values: [
          -229, -220, -210,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 3,
        kind: .h,
        values: [
          68, 78, 88,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 4,
        kind: .g,
        values: [
          3, 1, -1,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 4,
        kind: .h,
        values: [
          -32, -38, -43,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 5,
        kind: .g,
        values: [
          -4, -6, -8,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 5,
        kind: .h,
        values: [
          -10, -10, -9,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 6,
        kind: .g,
        values: [
          -112, -113, -114,
        ]
      ),
      IGRFCoefficient(
        n: 6,
        m: 6,
        kind: .h,
        values: [
          -13, -9, -4,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 0,
        kind: .g,
        values: [
          71, 69, 66,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 1,
        kind: .g,
        values: [
          -54, -56, -57,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 1,
        kind: .h,
        values: [
          -57, -63, -68,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 2,
        kind: .g,
        values: [
          0, -4, -7,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 2,
        kind: .h,
        values: [
          -27, -26, -24,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 3,
        kind: .g,
        values: [
          12, 10, 7,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 3,
        kind: .h,
        values: [
          -8, -6, -4,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 4,
        kind: .g,
        values: [
          -25, -24, -22,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 4,
        kind: .h,
        values: [
          9, 10, 11,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 5,
        kind: .g,
        values: [
          -9, -9, -9,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 5,
        kind: .h,
        values: [
          23, 25, 27,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 6,
        kind: .g,
        values: [
          13, 12, 11,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 6,
        kind: .h,
        values: [
          -19, -18, -17,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 7,
        kind: .g,
        values: [
          -2, -5, -8,
        ]
      ),
      IGRFCoefficient(
        n: 7,
        m: 7,
        kind: .h,
        values: [
          -17, -16, -14,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 0,
        kind: .g,
        values: [
          10, 11, 11,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 1,
        kind: .g,
        values: [
          9, 11, 13,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 1,
        kind: .h,
        values: [
          3, 4, 4,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 2,
        kind: .g,
        values: [
          -3, 0, 3,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 2,
        kind: .h,
        values: [
          -13, -14, -15,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 3,
        kind: .g,
        values: [
          -12, -12, -12,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 3,
        kind: .h,
        values: [
          5, 4, 2,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 4,
        kind: .g,
        values: [
          -4, -4, -4,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 4,
        kind: .h,
        values: [
          -17, -18, -19,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 5,
        kind: .g,
        values: [
          7, 7, 6,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 5,
        kind: .h,
        values: [
          4, 3, 1,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 6,
        kind: .g,
        values: [
          -5, -4, -2,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 6,
        kind: .h,
        values: [
          22, 20, 18,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 7,
        kind: .g,
        values: [
          12, 11, 9,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 7,
        kind: .h,
        values: [
          -3, -5, -6,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 8,
        kind: .g,
        values: [
          6, 4, 1,
        ]
      ),
      IGRFCoefficient(
        n: 8,
        m: 8,
        kind: .h,
        values: [
          -16, -18, -19,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 0,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 1,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 1,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 2,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 2,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 3,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 3,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 4,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 4,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 5,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 5,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 6,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 6,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 7,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 7,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 8,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 8,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 9,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 9,
        m: 9,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 0,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 1,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 1,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 2,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 2,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 3,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 3,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 4,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 4,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 5,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 5,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 6,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 6,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 7,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 7,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 8,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 8,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 9,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 9,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 10,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 10,
        m: 10,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 0,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 1,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 1,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 2,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 2,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 3,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 3,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 4,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 4,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 5,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 5,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 6,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 6,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 7,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 7,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 8,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 8,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 9,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 9,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 10,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 10,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 11,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 11,
        m: 11,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 0,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 1,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 1,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 2,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 2,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 3,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 3,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 4,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 4,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 5,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 5,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 6,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 6,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 7,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 7,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 8,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 8,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 9,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 9,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 10,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 10,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 11,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 11,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 12,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 12,
        m: 12,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 0,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 1,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 1,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 2,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 2,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 3,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 3,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 4,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 4,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 5,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 5,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 6,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 6,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 7,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 7,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 8,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 8,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 9,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 9,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 10,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 10,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 11,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 11,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 12,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 12,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 13,
        kind: .g,
        values: [
          0, 0, 0,
        ]
      ),
      IGRFCoefficient(
        n: 13,
        m: 13,
        kind: .h,
        values: [
          0, 0, 0,
        ]
      ),
    ]
  )
}
