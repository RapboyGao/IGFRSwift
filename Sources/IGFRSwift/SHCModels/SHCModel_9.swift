//
//  SHCModel_9.swift
//

import Foundation

extension SHCModel {
    static let model9 = SHCModel(
        version: 9,
        degree: 13,
        minYear: 1900.0,
        maxYear: 2005.0,
        years: [1900.0, 1905.0, 1910.0, 1915.0, 1920.0, 1925.0, 1930.0, 1935.0, 1940.0, 1945.0, 1950.0, 1955.0, 1960.0, 1965.0, 1970.0, 1975.0, 1980.0, 1985.0, 1990.0, 1995.0, 2000.0, 2005.0],
        coefficients: [
            Coefficient(n: 1, m: 0, type: .g, values: [-31543.0, -31464.0, -31354.0, -31212.0, -31060.0, -30926.0, -30805.0, -30715.0, -30654.0, -30594.0, -30554.0, -30500.0, -30421.0, -30334.0, -30220.0, -30100.0, -29992.0, -29873.0, -29775.0, -29692.0, -29619.4, -29552.9]),
            Coefficient(n: 1, m: 1, type: .g, values: [-2298.0, -2298.0, -2297.0, -2306.0, -2317.0, -2318.0, -2316.0, -2306.0, -2292.0, -2285.0, -2250.0, -2215.0, -2169.0, -2119.0, -2068.0, -2013.0, -1956.0, -1905.0, -1848.0, -1784.0, -1728.2, -1670.2]),
            Coefficient(n: 1, m: 1, type: .h, values: [5922.0, 5909.0, 5898.0, 5875.0, 5845.0, 5817.0, 5808.0, 5812.0, 5821.0, 5810.0, 5815.0, 5820.0, 5791.0, 5776.0, 5737.0, 5675.0, 5604.0, 5500.0, 5406.0, 5306.0, 5186.1, 5080.1]),
            Coefficient(n: 2, m: 0, type: .g, values: [-677.0, -728.0, -769.0, -802.0, -839.0, -893.0, -951.0, -1018.0, -1106.0, -1244.0, -1341.0, -1440.0, -1555.0, -1662.0, -1781.0, -1902.0, -1997.0, -2072.0, -2131.0, -2200.0, -2267.7, -2339.7]),
            Coefficient(n: 2, m: 1, type: .g, values: [2905.0, 2928.0, 2948.0, 2956.0, 2959.0, 2969.0, 2980.0, 2984.0, 2981.0, 2990.0, 2998.0, 3003.0, 3002.0, 2997.0, 3000.0, 3010.0, 3027.0, 3044.0, 3059.0, 3070.0, 3068.4, 3049.9]),
            Coefficient(n: 2, m: 1, type: .h, values: [-1061.0, -1086.0, -1128.0, -1191.0, -1259.0, -1334.0, -1424.0, -1520.0, -1614.0, -1702.0, -1810.0, -1898.0, -1967.0, -2016.0, -2047.0, -2067.0, -2129.0, -2197.0, -2279.0, -2366.0, -2481.6, -2595.1]),
            Coefficient(n: 2, m: 2, type: .g, values: [924.0, 1041.0, 1176.0, 1309.0, 1407.0, 1471.0, 1517.0, 1550.0, 1566.0, 1578.0, 1576.0, 1581.0, 1590.0, 1594.0, 1611.0, 1632.0, 1663.0, 1687.0, 1686.0, 1681.0, 1670.9, 1652.9]),
            Coefficient(n: 2, m: 2, type: .h, values: [1121.0, 1065.0, 1000.0, 917.0, 823.0, 728.0, 644.0, 586.0, 528.0, 477.0, 381.0, 291.0, 206.0, 114.0, 25.0, -68.0, -200.0, -306.0, -373.0, -413.0, -458.0, -513.5]),
            Coefficient(n: 3, m: 0, type: .g, values: [1022.0, 1037.0, 1058.0, 1084.0, 1111.0, 1140.0, 1172.0, 1206.0, 1240.0, 1282.0, 1297.0, 1302.0, 1302.0, 1297.0, 1287.0, 1276.0, 1281.0, 1296.0, 1314.0, 1335.0, 1339.6, 1334.1]),
            Coefficient(n: 3, m: 1, type: .g, values: [-1469.0, -1494.0, -1524.0, -1559.0, -1600.0, -1645.0, -1692.0, -1740.0, -1790.0, -1834.0, -1889.0, -1944.0, -1992.0, -2038.0, -2091.0, -2144.0, -2180.0, -2208.0, -2239.0, -2267.0, -2288.0, -2305.5]),
            Coefficient(n: 3, m: 1, type: .h, values: [-330.0, -357.0, -389.0, -421.0, -445.0, -462.0, -480.0, -494.0, -499.0, -499.0, -476.0, -462.0, -414.0, -404.0, -366.0, -333.0, -336.0, -310.0, -284.0, -262.0, -227.6, -199.6]),
            Coefficient(n: 3, m: 2, type: .g, values: [1256.0, 1239.0, 1223.0, 1212.0, 1205.0, 1202.0, 1205.0, 1215.0, 1232.0, 1255.0, 1274.0, 1288.0, 1289.0, 1292.0, 1278.0, 1260.0, 1251.0, 1247.0, 1248.0, 1249.0, 1252.1, 1246.1]),
            Coefficient(n: 3, m: 2, type: .h, values: [3.0, 34.0, 62.0, 84.0, 103.0, 119.0, 133.0, 146.0, 163.0, 186.0, 206.0, 216.0, 224.0, 240.0, 251.0, 262.0, 271.0, 284.0, 293.0, 302.0, 293.4, 270.9]),
            Coefficient(n: 3, m: 3, type: .g, values: [572.0, 635.0, 705.0, 778.0, 839.0, 881.0, 907.0, 918.0, 916.0, 913.0, 896.0, 882.0, 878.0, 856.0, 838.0, 830.0, 833.0, 829.0, 802.0, 759.0, 714.5, 672.0]),
            Coefficient(n: 3, m: 3, type: .h, values: [523.0, 480.0, 425.0, 360.0, 293.0, 229.0, 166.0, 101.0, 43.0, -11.0, -46.0, -83.0, -130.0, -165.0, -196.0, -223.0, -252.0, -297.0, -352.0, -427.0, -491.1, -531.1]),
            Coefficient(n: 4, m: 0, type: .g, values: [876.0, 880.0, 884.0, 887.0, 889.0, 891.0, 896.0, 903.0, 914.0, 944.0, 954.0, 958.0, 957.0, 957.0, 952.0, 946.0, 938.0, 936.0, 939.0, 940.0, 932.3, 918.8]),
            Coefficient(n: 4, m: 1, type: .g, values: [628.0, 643.0, 660.0, 678.0, 695.0, 711.0, 727.0, 744.0, 762.0, 776.0, 792.0, 796.0, 800.0, 804.0, 800.0, 791.0, 782.0, 780.0, 780.0, 780.0, 786.8, 797.8]),
            Coefficient(n: 4, m: 1, type: .h, values: [195.0, 203.0, 211.0, 218.0, 220.0, 216.0, 205.0, 188.0, 169.0, 144.0, 136.0, 133.0, 135.0, 148.0, 167.0, 191.0, 212.0, 232.0, 247.0, 262.0, 272.6, 281.1]),
            Coefficient(n: 4, m: 2, type: .g, values: [660.0, 653.0, 644.0, 631.0, 616.0, 601.0, 584.0, 565.0, 550.0, 544.0, 528.0, 510.0, 504.0, 479.0, 461.0, 438.0, 398.0, 361.0, 325.0, 290.0, 250.0, 210.0]),
            Coefficient(n: 4, m: 2, type: .h, values: [-69.0, -77.0, -90.0, -109.0, -134.0, -163.0, -195.0, -226.0, -252.0, -276.0, -278.0, -274.0, -278.0, -269.0, -266.0, -265.0, -257.0, -249.0, -240.0, -236.0, -231.9, -226.9]),
            Coefficient(n: 4, m: 3, type: .g, values: [-361.0, -380.0, -400.0, -416.0, -424.0, -426.0, -422.0, -415.0, -405.0, -421.0, -408.0, -397.0, -394.0, -390.0, -395.0, -405.0, -419.0, -424.0, -423.0, -418.0, -403.0, -380.5]),
            Coefficient(n: 4, m: 3, type: .h, values: [-210.0, -201.0, -189.0, -173.0, -153.0, -130.0, -109.0, -90.0, -72.0, -55.0, -37.0, -23.0, 3.0, 13.0, 26.0, 39.0, 53.0, 69.0, 84.0, 97.0, 119.8, 145.3]),
            Coefficient(n: 4, m: 4, type: .g, values: [134.0, 146.0, 160.0, 178.0, 199.0, 217.0, 234.0, 249.0, 265.0, 304.0, 303.0, 290.0, 269.0, 252.0, 234.0, 216.0, 199.0, 170.0, 141.0, 122.0, 111.3, 101.8]),
            Coefficient(n: 4, m: 4, type: .h, values: [-75.0, -65.0, -55.0, -51.0, -57.0, -70.0, -90.0, -114.0, -141.0, -178.0, -210.0, -230.0, -255.0, -269.0, -279.0, -288.0, -297.0, -297.0, -299.0, -306.0, -303.8, -305.3]),
            Coefficient(n: 5, m: 0, type: .g, values: [-184.0, -192.0, -201.0, -211.0, -221.0, -230.0, -237.0, -241.0, -241.0, -253.0, -240.0, -229.0, -222.0, -219.0, -216.0, -218.0, -218.0, -214.0, -214.0, -214.0, -218.8, -225.8]),
            Coefficient(n: 5, m: 1, type: .g, values: [328.0, 328.0, 327.0, 327.0, 326.0, 326.0, 327.0, 329.0, 334.0, 346.0, 349.0, 360.0, 362.0, 358.0, 359.0, 356.0, 357.0, 355.0, 353.0, 352.0, 351.4, 354.9]),
            Coefficient(n: 5, m: 1, type: .h, values: [-210.0, -193.0, -172.0, -148.0, -122.0, -96.0, -72.0, -51.0, -33.0, -12.0, 3.0, 15.0, 16.0, 19.0, 26.0, 31.0, 46.0, 47.0, 46.0, 46.0, 43.8, 42.3]),
            Coefficient(n: 5, m: 2, type: .g, values: [264.0, 259.0, 253.0, 245.0, 236.0, 226.0, 218.0, 211.0, 208.0, 194.0, 211.0, 230.0, 242.0, 254.0, 262.0, 264.0, 261.0, 253.0, 245.0, 235.0, 222.3, 209.3]),
            Coefficient(n: 5, m: 2, type: .h, values: [53.0, 56.0, 57.0, 58.0, 58.0, 58.0, 60.0, 64.0, 71.0, 95.0, 103.0, 110.0, 125.0, 128.0, 139.0, 148.0, 150.0, 150.0, 154.0, 165.0, 171.9, 179.4]),
            Coefficient(n: 5, m: 3, type: .g, values: [5.0, -1.0, -9.0, -16.0, -23.0, -28.0, -32.0, -33.0, -33.0, -20.0, -20.0, -23.0, -26.0, -31.0, -42.0, -59.0, -74.0, -93.0, -109.0, -118.0, -130.4, -136.4]),
            Coefficient(n: 5, m: 3, type: .h, values: [-33.0, -32.0, -33.0, -34.0, -38.0, -44.0, -53.0, -64.0, -75.0, -67.0, -87.0, -98.0, -117.0, -126.0, -139.0, -152.0, -151.0, -154.0, -153.0, -143.0, -133.1, -123.1]),
            Coefficient(n: 5, m: 4, type: .g, values: [-86.0, -93.0, -102.0, -111.0, -119.0, -125.0, -131.0, -136.0, -141.0, -142.0, -147.0, -152.0, -156.0, -157.0, -160.0, -159.0, -162.0, -164.0, -165.0, -166.0, -168.6, -168.6]),
            Coefficient(n: 5, m: 4, type: .h, values: [-124.0, -125.0, -126.0, -126.0, -125.0, -122.0, -118.0, -115.0, -113.0, -119.0, -122.0, -121.0, -114.0, -97.0, -91.0, -83.0, -78.0, -75.0, -69.0, -55.0, -39.3, -20.3]),
            Coefficient(n: 5, m: 5, type: .g, values: [-16.0, -26.0, -38.0, -51.0, -62.0, -69.0, -74.0, -76.0, -76.0, -82.0, -76.0, -69.0, -63.0, -62.0, -56.0, -49.0, -48.0, -46.0, -36.0, -17.0, -12.9, -13.9]),
            Coefficient(n: 5, m: 5, type: .h, values: [3.0, 11.0, 21.0, 32.0, 43.0, 51.0, 58.0, 64.0, 69.0, 82.0, 80.0, 78.0, 81.0, 81.0, 83.0, 88.0, 92.0, 95.0, 97.0, 107.0, 106.3, 103.8]),
            Coefficient(n: 6, m: 0, type: .g, values: [63.0, 62.0, 62.0, 61.0, 61.0, 61.0, 60.0, 59.0, 57.0, 59.0, 54.0, 47.0, 46.0, 45.0, 43.0, 45.0, 48.0, 53.0, 61.0, 68.0, 72.3, 74.3]),
            Coefficient(n: 6, m: 1, type: .g, values: [61.0, 60.0, 58.0, 57.0, 55.0, 54.0, 53.0, 53.0, 54.0, 57.0, 57.0, 57.0, 58.0, 61.0, 64.0, 66.0, 66.0, 65.0, 65.0, 67.0, 68.2, 69.7]),
            Coefficient(n: 6, m: 1, type: .h, values: [-9.0, -7.0, -5.0, -2.0, 0.0, 3.0, 4.0, 4.0, 4.0, 6.0, -1.0, -9.0, -10.0, -11.0, -12.0, -13.0, -15.0, -16.0, -16.0, -17.0, -17.4, -20.9]),
            Coefficient(n: 6, m: 2, type: .g, values: [-11.0, -11.0, -11.0, -10.0, -10.0, -9.0, -9.0, -8.0, -7.0, 6.0, 4.0, 3.0, 1.0, 8.0, 15.0, 28.0, 42.0, 51.0, 59.0, 68.0, 74.2, 77.7]),
            Coefficient(n: 6, m: 2, type: .h, values: [83.0, 86.0, 89.0, 93.0, 96.0, 99.0, 102.0, 104.0, 105.0, 100.0, 99.0, 96.0, 99.0, 100.0, 100.0, 99.0, 93.0, 88.0, 82.0, 72.0, 63.7, 54.7]),
            Coefficient(n: 6, m: 3, type: .g, values: [-217.0, -221.0, -224.0, -228.0, -233.0, -238.0, -242.0, -246.0, -249.0, -246.0, -247.0, -247.0, -237.0, -228.0, -212.0, -198.0, -192.0, -185.0, -178.0, -170.0, -160.9, -151.4]),
            Coefficient(n: 6, m: 3, type: .h, values: [2.0, 4.0, 5.0, 8.0, 11.0, 14.0, 19.0, 25.0, 33.0, 16.0, 33.0, 48.0, 60.0, 68.0, 72.0, 75.0, 71.0, 69.0, 69.0, 67.0, 65.1, 64.1]),
            Coefficient(n: 6, m: 4, type: .g, values: [-58.0, -57.0, -54.0, -51.0, -46.0, -40.0, -32.0, -25.0, -18.0, -25.0, -16.0, -8.0, -1.0, 4.0, 2.0, 1.0, 4.0, 4.0, 3.0, -1.0, -5.9, -14.4]),
            Coefficient(n: 6, m: 4, type: .h, values: [-35.0, -32.0, -29.0, -26.0, -22.0, -18.0, -16.0, -15.0, -15.0, -9.0, -12.0, -16.0, -20.0, -32.0, -37.0, -41.0, -43.0, -48.0, -52.0, -58.0, -61.2, -63.2]),
            Coefficient(n: 6, m: 5, type: .g, values: [59.0, 57.0, 54.0, 49.0, 44.0, 39.0, 32.0, 25.0, 18.0, 21.0, 12.0, 7.0, -2.0, 1.0, 3.0, 6.0, 14.0, 16.0, 18.0, 19.0, 16.9, 14.4]),
            Coefficient(n: 6, m: 5, type: .h, values: [36.0, 32.0, 28.0, 23.0, 18.0, 13.0, 8.0, 4.0, 0.0, -16.0, -12.0, -12.0, -11.0, -8.0, -6.0, -4.0, -2.0, -1.0, 1.0, 1.0, 0.7, -0.3]),
            Coefficient(n: 6, m: 6, type: .g, values: [-90.0, -92.0, -95.0, -98.0, -101.0, -103.0, -104.0, -106.0, -107.0, -104.0, -105.0, -107.0, -113.0, -111.0, -112.0, -111.0, -108.0, -102.0, -96.0, -93.0, -90.4, -86.9]),
            Coefficient(n: 6, m: 6, type: .h, values: [-69.0, -67.0, -65.0, -62.0, -57.0, -52.0, -46.0, -40.0, -33.0, -39.0, -30.0, -24.0, -17.0, -7.0, 1.0, 11.0, 17.0, 21.0, 24.0, 36.0, 43.8, 51.3]),
            Coefficient(n: 7, m: 0, type: .g, values: [70.0, 70.0, 71.0, 72.0, 73.0, 73.0, 74.0, 74.0, 74.0, 70.0, 65.0, 65.0, 67.0, 75.0, 72.0, 71.0, 72.0, 74.0, 77.0, 77.0, 79.0, 80.0]),
            Coefficient(n: 7, m: 1, type: .g, values: [-55.0, -54.0, -54.0, -54.0, -54.0, -54.0, -54.0, -53.0, -53.0, -40.0, -55.0, -56.0, -56.0, -57.0, -57.0, -56.0, -59.0, -62.0, -64.0, -72.0, -74.0, -74.5]),
            Coefficient(n: 7, m: 1, type: .h, values: [-45.0, -46.0, -47.0, -48.0, -49.0, -50.0, -51.0, -52.0, -52.0, -45.0, -35.0, -50.0, -55.0, -61.0, -70.0, -77.0, -82.0, -83.0, -80.0, -69.0, -64.6, -61.1]),
            Coefficient(n: 7, m: 2, type: .g, values: [0.0, 0.0, 1.0, 2.0, 2.0, 3.0, 4.0, 4.0, 4.0, 0.0, 2.0, 2.0, 5.0, 4.0, 1.0, 1.0, 2.0, 3.0, 2.0, 1.0, 0.0, -1.5]),
            Coefficient(n: 7, m: 2, type: .h, values: [-13.0, -14.0, -14.0, -14.0, -14.0, -14.0, -15.0, -17.0, -18.0, -18.0, -17.0, -24.0, -28.0, -27.0, -27.0, -26.0, -27.0, -27.0, -26.0, -25.0, -24.2, -22.7]),
            Coefficient(n: 7, m: 3, type: .g, values: [34.0, 33.0, 32.0, 31.0, 29.0, 27.0, 25.0, 23.0, 20.0, 0.0, 1.0, 10.0, 15.0, 13.0, 14.0, 16.0, 21.0, 24.0, 26.0, 28.0, 33.3, 38.8]),
            Coefficient(n: 7, m: 3, type: .h, values: [-10.0, -11.0, -12.0, -12.0, -13.0, -14.0, -14.0, -14.0, -14.0, 2.0, 0.0, -4.0, -6.0, -2.0, -4.0, -5.0, -5.0, -2.0, 0.0, 4.0, 6.2, 6.7]),
            Coefficient(n: 7, m: 4, type: .g, values: [-41.0, -41.0, -40.0, -38.0, -37.0, -35.0, -34.0, -33.0, -31.0, -29.0, -40.0, -32.0, -32.0, -26.0, -22.0, -14.0, -12.0, -6.0, -1.0, 5.0, 9.1, 12.6]),
            Coefficient(n: 7, m: 4, type: .h, values: [-1.0, 0.0, 1.0, 2.0, 4.0, 5.0, 6.0, 7.0, 7.0, 6.0, 10.0, 8.0, 7.0, 6.0, 8.0, 10.0, 16.0, 20.0, 21.0, 24.0, 24.0, 25.5]),
            Coefficient(n: 7, m: 5, type: .g, values: [-21.0, -20.0, -19.0, -18.0, -16.0, -14.0, -12.0, -11.0, -9.0, -10.0, -7.0, -11.0, -7.0, -6.0, -2.0, 0.0, 1.0, 4.0, 5.0, 4.0, 6.9, 9.4]),
            Coefficient(n: 7, m: 5, type: .h, values: [28.0, 28.0, 28.0, 28.0, 28.0, 29.0, 29.0, 29.0, 29.0, 28.0, 36.0, 28.0, 23.0, 26.0, 23.0, 22.0, 18.0, 17.0, 17.0, 17.0, 14.8, 10.8]),
            Coefficient(n: 7, m: 6, type: .g, values: [18.0, 18.0, 18.0, 19.0, 19.0, 19.0, 18.0, 18.0, 17.0, 15.0, 5.0, 9.0, 17.0, 13.0, 13.0, 12.0, 11.0, 10.0, 9.0, 8.0, 7.3, 5.8]),
            Coefficient(n: 7, m: 6, type: .h, values: [-12.0, -12.0, -13.0, -15.0, -16.0, -17.0, -18.0, -19.0, -20.0, -17.0, -18.0, -20.0, -18.0, -23.0, -23.0, -23.0, -23.0, -23.0, -23.0, -24.0, -25.4, -25.9]),
            Coefficient(n: 7, m: 7, type: .g, values: [6.0, 6.0, 6.0, 6.0, 6.0, 6.0, 6.0, 6.0, 5.0, 29.0, 19.0, 18.0, 8.0, 1.0, -2.0, -5.0, -2.0, 0.0, 0.0, -2.0, -1.2, 1.3]),
            Coefficient(n: 7, m: 7, type: .h, values: [-22.0, -22.0, -22.0, -22.0, -22.0, -21.0, -20.0, -19.0, -19.0, -22.0, -16.0, -18.0, -17.0, -12.0, -11.0, -12.0, -10.0, -7.0, -4.0, -6.0, -5.8, -4.8]),
            Coefficient(n: 8, m: 0, type: .g, values: [11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 11.0, 13.0, 22.0, 11.0, 15.0, 13.0, 14.0, 14.0, 18.0, 21.0, 23.0, 25.0, 24.4, 24.9]),
            Coefficient(n: 8, m: 1, type: .g, values: [8.0, 8.0, 8.0, 8.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 15.0, 9.0, 6.0, 5.0, 6.0, 6.0, 6.0, 6.0, 5.0, 6.0, 6.6, 7.6]),
            Coefficient(n: 8, m: 1, type: .h, values: [8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 12.0, 5.0, 10.0, 11.0, 7.0, 7.0, 6.0, 7.0, 8.0, 10.0, 11.0, 11.9, 10.9]),
            Coefficient(n: 8, m: 2, type: .g, values: [-4.0, -4.0, -4.0, -4.0, -3.0, -3.0, -3.0, -3.0, -3.0, -8.0, -4.0, -6.0, -4.0, -4.0, -2.0, -1.0, 0.0, 0.0, -1.0, -6.0, -9.2, -11.7]),
            Coefficient(n: 8, m: 2, type: .h, values: [-14.0, -15.0, -15.0, -15.0, -15.0, -15.0, -15.0, -15.0, -14.0, -21.0, -22.0, -15.0, -14.0, -12.0, -15.0, -16.0, -18.0, -19.0, -19.0, -21.0, -21.5, -21.0]),
            Coefficient(n: 8, m: 3, type: .g, values: [-9.0, -9.0, -9.0, -9.0, -9.0, -9.0, -9.0, -9.0, -10.0, -5.0, -1.0, -14.0, -11.0, -14.0, -13.0, -12.0, -11.0, -11.0, -10.0, -9.0, -7.9, -6.9]),
            Coefficient(n: 8, m: 3, type: .h, values: [7.0, 7.0, 6.0, 6.0, 6.0, 6.0, 5.0, 5.0, 5.0, -12.0, 0.0, 5.0, 7.0, 9.0, 6.0, 4.0, 4.0, 5.0, 6.0, 8.0, 8.5, 10.0]),
            Coefficient(n: 8, m: 4, type: .g, values: [1.0, 1.0, 1.0, 2.0, 2.0, 2.0, 2.0, 1.0, 1.0, 9.0, 11.0, 6.0, 2.0, 0.0, -3.0, -8.0, -7.0, -9.0, -12.0, -14.0, -16.6, -18.6]),
            Coefficient(n: 8, m: 4, type: .h, values: [-13.0, -13.0, -13.0, -13.0, -14.0, -14.0, -14.0, -15.0, -15.0, -7.0, -21.0, -23.0, -18.0, -16.0, -17.0, -19.0, -22.0, -23.0, -22.0, -23.0, -21.5, -19.5]),
            Coefficient(n: 8, m: 5, type: .g, values: [2.0, 2.0, 2.0, 3.0, 4.0, 4.0, 5.0, 6.0, 6.0, 7.0, 15.0, 10.0, 10.0, 8.0, 5.0, 4.0, 4.0, 4.0, 3.0, 9.0, 9.1, 10.1]),
            Coefficient(n: 8, m: 5, type: .h, values: [5.0, 5.0, 5.0, 5.0, 5.0, 5.0, 5.0, 5.0, 5.0, 2.0, -8.0, 3.0, 4.0, 4.0, 6.0, 6.0, 9.0, 11.0, 12.0, 15.0, 15.5, 16.0]),
            Coefficient(n: 8, m: 6, type: .g, values: [-9.0, -8.0, -8.0, -8.0, -7.0, -7.0, -6.0, -6.0, -5.0, -10.0, -13.0, -7.0, -5.0, -1.0, 0.0, 0.0, 3.0, 4.0, 4.0, 6.0, 7.0, 9.5]),
            Coefficient(n: 8, m: 6, type: .h, values: [16.0, 16.0, 16.0, 16.0, 17.0, 17.0, 18.0, 18.0, 19.0, 18.0, 17.0, 23.0, 23.0, 24.0, 21.0, 18.0, 16.0, 14.0, 12.0, 11.0, 8.9, 7.4]),
            Coefficient(n: 8, m: 7, type: .g, values: [5.0, 5.0, 5.0, 6.0, 6.0, 7.0, 8.0, 8.0, 9.0, 7.0, 5.0, 6.0, 10.0, 11.0, 11.0, 10.0, 6.0, 4.0, 2.0, -5.0, -7.9, -11.4]),
            Coefficient(n: 8, m: 7, type: .h, values: [-5.0, -5.0, -5.0, -5.0, -5.0, -5.0, -5.0, -5.0, -5.0, 3.0, -4.0, -4.0, 1.0, -3.0, -6.0, -10.0, -13.0, -15.0, -16.0, -16.0, -14.9, -12.9]),
            Coefficient(n: 8, m: 8, type: .g, values: [8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 7.0, 7.0, 2.0, -1.0, 9.0, 8.0, 4.0, 3.0, 1.0, -1.0, -4.0, -6.0, -7.0, -7.0, -5.0]),
            Coefficient(n: 8, m: 8, type: .h, values: [-18.0, -18.0, -18.0, -18.0, -19.0, -19.0, -19.0, -19.0, -19.0, -11.0, -17.0, -13.0, -20.0, -17.0, -16.0, -17.0, -15.0, -11.0, -10.0, -4.0, -2.1, -0.1]),
            Coefficient(n: 9, m: 0, type: .g, values: [8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 5.0, 3.0, 4.0, 4.0, 8.0, 8.0, 7.0, 5.0, 5.0, 4.0, 4.0, 5.0, 5.0]),
            Coefficient(n: 9, m: 1, type: .g, values: [10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, -21.0, -7.0, 9.0, 6.0, 10.0, 10.0, 10.0, 10.0, 10.0, 9.0, 9.0, 9.4, 9.4]),
            Coefficient(n: 9, m: 1, type: .h, values: [-20.0, -20.0, -20.0, -20.0, -20.0, -20.0, -20.0, -20.0, -21.0, -27.0, -24.0, -11.0, -18.0, -22.0, -21.0, -21.0, -21.0, -21.0, -20.0, -20.0, -19.7, -19.7]),
            Coefficient(n: 9, m: 2, type: .g, values: [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, -1.0, -4.0, 0.0, 2.0, 2.0, 2.0, 1.0, 1.0, 1.0, 3.0, 3.0, 3.0]),
            Coefficient(n: 9, m: 2, type: .h, values: [14.0, 14.0, 14.0, 14.0, 14.0, 14.0, 14.0, 15.0, 15.0, 17.0, 19.0, 12.0, 12.0, 15.0, 16.0, 16.0, 16.0, 15.0, 15.0, 15.0, 13.4, 13.4]),
            Coefficient(n: 9, m: 3, type: .g, values: [-11.0, -11.0, -11.0, -11.0, -11.0, -11.0, -12.0, -12.0, -12.0, -11.0, -25.0, -5.0, -9.0, -13.0, -12.0, -12.0, -12.0, -12.0, -12.0, -10.0, -8.4, -8.4]),
            Coefficient(n: 9, m: 3, type: .h, values: [5.0, 5.0, 5.0, 5.0, 5.0, 5.0, 5.0, 5.0, 5.0, 29.0, 12.0, 7.0, 2.0, 7.0, 6.0, 7.0, 9.0, 9.0, 11.0, 12.0, 12.5, 12.5]),
            Coefficient(n: 9, m: 4, type: .g, values: [12.0, 12.0, 12.0, 12.0, 12.0, 12.0, 12.0, 11.0, 11.0, 3.0, 10.0, 2.0, 1.0, 10.0, 10.0, 10.0, 9.0, 9.0, 9.0, 8.0, 6.3, 6.3]),
            Coefficient(n: 9, m: 4, type: .h, values: [-3.0, -3.0, -3.0, -3.0, -3.0, -3.0, -3.0, -3.0, -3.0, -9.0, 2.0, 6.0, 0.0, -4.0, -4.0, -4.0, -5.0, -6.0, -7.0, -6.0, -6.2, -6.2]),
            Coefficient(n: 9, m: 5, type: .g, values: [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 16.0, 5.0, 4.0, 4.0, -1.0, -1.0, -1.0, -3.0, -3.0, -4.0, -8.0, -8.9, -8.9]),
            Coefficient(n: 9, m: 5, type: .h, values: [-2.0, -2.0, -2.0, -2.0, -2.0, -2.0, -2.0, -3.0, -3.0, 4.0, 2.0, -2.0, -3.0, -5.0, -5.0, -5.0, -6.0, -6.0, -7.0, -8.0, -8.4, -8.4]),
            Coefficient(n: 9, m: 6, type: .g, values: [-2.0, -2.0, -2.0, -2.0, -2.0, -2.0, -2.0, -2.0, -2.0, -3.0, -5.0, 1.0, -1.0, -1.0, 0.0, -1.0, -1.0, -1.0, -2.0, -1.0, -1.5, -1.5]),
            Coefficient(n: 9, m: 6, type: .h, values: [8.0, 8.0, 8.0, 8.0, 9.0, 9.0, 9.0, 9.0, 9.0, 9.0, 8.0, 10.0, 9.0, 10.0, 10.0, 10.0, 9.0, 9.0, 9.0, 8.0, 8.4, 8.4]),
            Coefficient(n: 9, m: 7, type: .g, values: [2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 3.0, 3.0, 3.0, -4.0, -2.0, 2.0, -2.0, 5.0, 3.0, 4.0, 7.0, 7.0, 7.0, 10.0, 9.3, 9.3]),
            Coefficient(n: 9, m: 7, type: .h, values: [10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 11.0, 11.0, 6.0, 8.0, 7.0, 8.0, 10.0, 11.0, 11.0, 10.0, 9.0, 8.0, 5.0, 3.8, 3.8]),
            Coefficient(n: 9, m: 8, type: .g, values: [-1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, -3.0, 3.0, 2.0, 3.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, -2.0, -4.3, -4.3]),
            Coefficient(n: 9, m: 8, type: .h, values: [-2.0, -2.0, -2.0, -2.0, -2.0, -2.0, -2.0, -2.0, -2.0, 1.0, -11.0, -6.0, 0.0, -4.0, -2.0, -3.0, -6.0, -7.0, -7.0, -8.0, -8.2, -8.2]),
            Coefficient(n: 9, m: 9, type: .g, values: [-1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -2.0, -2.0, -2.0, -4.0, 8.0, 5.0, -1.0, -2.0, -1.0, -2.0, -5.0, -5.0, -6.0, -8.0, -8.2, -8.2]),
            Coefficient(n: 9, m: 9, type: .h, values: [2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 8.0, -7.0, 5.0, 5.0, 1.0, 1.0, 1.0, 2.0, 2.0, 2.0, 3.0, 4.8, 4.8]),
            Coefficient(n: 10, m: 0, type: .g, values: [-3.0, -3.0, -3.0, -3.0, -3.0, -3.0, -3.0, -3.0, -3.0, -3.0, -8.0, -3.0, 1.0, -2.0, -3.0, -3.0, -4.0, -4.0, -3.0, -3.0, -2.6, -2.6]),
            Coefficient(n: 10, m: 1, type: .g, values: [-4.0, -4.0, -4.0, -4.0, -4.0, -4.0, -4.0, -4.0, -4.0, 11.0, 4.0, -5.0, -3.0, -3.0, -3.0, -3.0, -4.0, -4.0, -4.0, -6.0, -6.0, -6.0]),
            Coefficient(n: 10, m: 1, type: .h, values: [2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 5.0, 13.0, -4.0, 4.0, 2.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.7, 1.7]),
            Coefficient(n: 10, m: 2, type: .g, values: [2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 1.0, -1.0, -1.0, 4.0, 2.0, 2.0, 2.0, 2.0, 3.0, 2.0, 2.0, 1.7, 1.7]),
            Coefficient(n: 10, m: 2, type: .h, values: [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, -2.0, 0.0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0]),
            Coefficient(n: 10, m: 3, type: .g, values: [-5.0, -5.0, -5.0, -5.0, -5.0, -5.0, -5.0, -5.0, -5.0, 2.0, 13.0, 2.0, 0.0, -5.0, -5.0, -5.0, -5.0, -5.0, -5.0, -4.0, -3.1, -3.1]),
            Coefficient(n: 10, m: 3, type: .h, values: [2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, -20.0, -10.0, -8.0, 0.0, 2.0, 3.0, 3.0, 3.0, 3.0, 3.0, 4.0, 4.0, 4.0]),
            Coefficient(n: 10, m: 4, type: .g, values: [-2.0, -2.0, -2.0, -2.0, -2.0, -2.0, -2.0, -2.0, -2.0, -5.0, -4.0, -3.0, -1.0, -2.0, -1.0, -2.0, -2.0, -2.0, -2.0, -1.0, -0.5, -0.5]),
            Coefficient(n: 10, m: 4, type: .h, values: [6.0, 6.0, 6.0, 6.0, 6.0, 6.0, 6.0, 6.0, 6.0, -1.0, 2.0, -2.0, 2.0, 6.0, 4.0, 4.0, 6.0, 6.0, 6.0, 5.0, 4.9, 4.9]),
            Coefficient(n: 10, m: 5, type: .g, values: [6.0, 6.0, 6.0, 6.0, 6.0, 6.0, 6.0, 6.0, 6.0, -1.0, 4.0, 7.0, 4.0, 4.0, 6.0, 5.0, 5.0, 5.0, 4.0, 4.0, 3.7, 3.7]),
            Coefficient(n: 10, m: 5, type: .h, values: [-4.0, -4.0, -4.0, -4.0, -4.0, -4.0, -4.0, -4.0, -4.0, -6.0, -3.0, -4.0, -5.0, -4.0, -4.0, -4.0, -4.0, -4.0, -4.0, -5.0, -5.9, -5.9]),
            Coefficient(n: 10, m: 6, type: .g, values: [4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 8.0, 12.0, 4.0, 6.0, 4.0, 4.0, 4.0, 3.0, 3.0, 3.0, 2.0, 1.0, 1.0]),
            Coefficient(n: 10, m: 6, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 6.0, 6.0, 1.0, 1.0, 0.0, 0.0, -1.0, 0.0, 0.0, 0.0, -1.0, -1.2, -1.2]),
            Coefficient(n: 10, m: 7, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0, 3.0, -2.0, 1.0, 0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 2.0, 2.0]),
            Coefficient(n: 10, m: 7, type: .h, values: [-2.0, -2.0, -2.0, -2.0, -2.0, -2.0, -2.0, -1.0, -1.0, -4.0, -3.0, -3.0, -1.0, -2.0, -1.0, -1.0, -1.0, -1.0, -2.0, -2.0, -2.9, -2.9]),
            Coefficient(n: 10, m: 8, type: .g, values: [2.0, 2.0, 2.0, 1.0, 1.0, 1.0, 1.0, 2.0, 2.0, -3.0, 2.0, 6.0, -1.0, 2.0, 0.0, 0.0, 2.0, 2.0, 3.0, 5.0, 4.2, 4.2]),
            Coefficient(n: 10, m: 8, type: .h, values: [4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0, -2.0, 6.0, 7.0, 6.0, 3.0, 3.0, 3.0, 4.0, 4.0, 3.0, 1.0, 0.2, 0.2]),
            Coefficient(n: 10, m: 9, type: .g, values: [2.0, 2.0, 2.0, 2.0, 3.0, 3.0, 3.0, 3.0, 3.0, 5.0, 10.0, -2.0, 2.0, 2.0, 3.0, 3.0, 3.0, 3.0, 3.0, 1.0, 0.3, 0.3]),
            Coefficient(n: 10, m: 9, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 11.0, -1.0, 0.0, 0.0, 1.0, 1.0, 0.0, 0.0, -1.0, -2.0, -2.2, -2.2]),
            Coefficient(n: 10, m: 10, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -2.0, 3.0, 0.0, 0.0, 0.0, -1.0, -1.0, 0.0, 0.0, 0.0, 0.0, -1.1, -1.1]),
            Coefficient(n: 10, m: 10, type: .h, values: [-6.0, -6.0, -6.0, -6.0, -6.0, -6.0, -6.0, -6.0, -6.0, -2.0, 8.0, -3.0, -7.0, -6.0, -4.0, -5.0, -6.0, -6.0, -6.0, -7.0, -7.4, -7.4]),
            Coefficient(n: 11, m: 0, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.7, 2.7]),
            Coefficient(n: 11, m: 1, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1.7, -1.7]),
            Coefficient(n: 11, m: 1, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1]),
            Coefficient(n: 11, m: 2, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1.9, -1.9]),
            Coefficient(n: 11, m: 2, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.3, 1.3]),
            Coefficient(n: 11, m: 3, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5]),
            Coefficient(n: 11, m: 3, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.9, -0.9]),
            Coefficient(n: 11, m: 4, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.1, -0.1]),
            Coefficient(n: 11, m: 4, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -2.6, -2.6]),
            Coefficient(n: 11, m: 5, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1]),
            Coefficient(n: 11, m: 5, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.9, 0.9]),
            Coefficient(n: 11, m: 6, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.7, -0.7]),
            Coefficient(n: 11, m: 6, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.7, -0.7]),
            Coefficient(n: 11, m: 7, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7]),
            Coefficient(n: 11, m: 7, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -2.8, -2.8]),
            Coefficient(n: 11, m: 8, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.7, 1.7]),
            Coefficient(n: 11, m: 8, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.9, -0.9]),
            Coefficient(n: 11, m: 9, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1]),
            Coefficient(n: 11, m: 9, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1.2, -1.2]),
            Coefficient(n: 11, m: 10, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.2, 1.2]),
            Coefficient(n: 11, m: 10, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1.9, -1.9]),
            Coefficient(n: 11, m: 11, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0]),
            Coefficient(n: 11, m: 11, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.9, -0.9]),
            Coefficient(n: 12, m: 0, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -2.2, -2.2]),
            Coefficient(n: 12, m: 1, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.3, -0.3]),
            Coefficient(n: 12, m: 1, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.4, -0.4]),
            Coefficient(n: 12, m: 2, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2]),
            Coefficient(n: 12, m: 2, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3]),
            Coefficient(n: 12, m: 3, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.9, 0.9]),
            Coefficient(n: 12, m: 3, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.5, 2.5]),
            Coefficient(n: 12, m: 4, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.2, -0.2]),
            Coefficient(n: 12, m: 4, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -2.6, -2.6]),
            Coefficient(n: 12, m: 5, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.9, 0.9]),
            Coefficient(n: 12, m: 5, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7]),
            Coefficient(n: 12, m: 6, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.5, -0.5]),
            Coefficient(n: 12, m: 6, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3]),
            Coefficient(n: 12, m: 7, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3]),
            Coefficient(n: 12, m: 7, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 8, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.3, -0.3]),
            Coefficient(n: 12, m: 8, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]),
            Coefficient(n: 12, m: 9, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.4, -0.4]),
            Coefficient(n: 12, m: 9, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3]),
            Coefficient(n: 12, m: 10, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.1, -0.1]),
            Coefficient(n: 12, m: 10, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.9, -0.9]),
            Coefficient(n: 12, m: 11, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.2, -0.2]),
            Coefficient(n: 12, m: 11, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.4, -0.4]),
            Coefficient(n: 12, m: 12, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.4, -0.4]),
            Coefficient(n: 12, m: 12, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8]),
            Coefficient(n: 13, m: 0, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.2, -0.2]),
            Coefficient(n: 13, m: 1, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.9, -0.9]),
            Coefficient(n: 13, m: 1, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.9, -0.9]),
            Coefficient(n: 13, m: 2, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3]),
            Coefficient(n: 13, m: 2, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2]),
            Coefficient(n: 13, m: 3, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1]),
            Coefficient(n: 13, m: 3, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.8, 1.8]),
            Coefficient(n: 13, m: 4, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.4, -0.4]),
            Coefficient(n: 13, m: 4, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.4, -0.4]),
            Coefficient(n: 13, m: 5, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.3, 1.3]),
            Coefficient(n: 13, m: 5, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0, -1.0]),
            Coefficient(n: 13, m: 6, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.4, -0.4]),
            Coefficient(n: 13, m: 6, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.1, -0.1]),
            Coefficient(n: 13, m: 7, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7]),
            Coefficient(n: 13, m: 7, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7]),
            Coefficient(n: 13, m: 8, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.4, -0.4]),
            Coefficient(n: 13, m: 8, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3]),
            Coefficient(n: 13, m: 9, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3]),
            Coefficient(n: 13, m: 9, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6]),
            Coefficient(n: 13, m: 10, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.1, -0.1]),
            Coefficient(n: 13, m: 10, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3]),
            Coefficient(n: 13, m: 11, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4]),
            Coefficient(n: 13, m: 11, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.2, -0.2]),
            Coefficient(n: 13, m: 12, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]),
            Coefficient(n: 13, m: 12, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.5, -0.5]),
            Coefficient(n: 13, m: 13, type: .g, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1]),
            Coefficient(n: 13, m: 13, type: .h, values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.9, -0.9])
        ]
    )
}
