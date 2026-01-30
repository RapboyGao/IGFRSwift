import Foundation

/// SHCModel 资源加载扩展
///
/// SHCModel resource loading extension
public extension SHCModel {
    /// 从资源文件加载 SHCModel
    ///
    /// Load SHCModel from resource file
    ///
    /// - Parameter name: 资源文件名（不含扩展名）
    ///   Resource file name (without extension)
    /// - Returns: 加载的 SHCModel 对象
    ///   Loaded SHCModel object
    static func loadResource(_ name: String) -> SHCModel {
        var model = SHCModel(fileName: "", headers: [], headerNumbers: [], epochs: [], coefficients: [])
        guard let url = Bundle.module.url(forResource: name, withExtension: "json") else {
            return model
        }
        do {
            let data = try Data(contentsOf: url)
            model = try JSONDecoder().decode(SHCModel.self, from: data)
        } catch {
            return model
        }
        return model
    }

    /// 编码键枚举
    ///
    /// Coding keys enum
    private enum CodingKeys: String, CodingKey {
        /// 文件名字段
        ///
        /// File name field
        case fileName
        /// 头部信息字段
        ///
        /// Headers field
        case headers
        /// 头部数字信息字段
        ///
        /// Header numbers field
        case headerNumbers
        /// 历元字段
        ///
        /// Epochs field
        case epochs
        /// 系数字段
        ///
        /// Coefficients field
        case coefficients
    }

    /// 从解码器初始化
    ///
    /// Initialize from decoder
    ///
    /// - Parameter decoder: 解码器
    ///   Decoder
    /// - Throws: 解码错误
    ///   Decoding error
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let fileName = try container.decode(String.self, forKey: .fileName)
        let headers = try container.decode([String].self, forKey: .headers)
        let headerNumbers = try container.decode([Double].self, forKey: .headerNumbers)
        let epochs = try container.decode([Double].self, forKey: .epochs)
        let coefficients = try container.decode([Coefficient].self, forKey: .coefficients)
        self.init(
            fileName: fileName,
            headers: headers,
            headerNumbers: headerNumbers,
            epochs: epochs,
            coefficients: coefficients
        )
    }

    /// 编码到编码器
    ///
    /// Encode to encoder
    ///
    /// - Parameter encoder: 编码器
    ///   Encoder
    /// - Throws: 编码错误
    ///   Encoding error
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(fileName, forKey: .fileName)
        try container.encode(headers, forKey: .headers)
        try container.encode(headerNumbers, forKey: .headerNumbers)
        try container.encode(epochs, forKey: .epochs)
        try container.encode(coefficients, forKey: .coefficients)
    }
}
