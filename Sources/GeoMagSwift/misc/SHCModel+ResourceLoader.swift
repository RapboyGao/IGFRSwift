import Foundation

public extension SHCModel {
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

    private enum CodingKeys: String, CodingKey {
        case fileName
        case headers
        case headerNumbers
        case epochs
        case coefficients
    }

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

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(fileName, forKey: .fileName)
        try container.encode(headers, forKey: .headers)
        try container.encode(headerNumbers, forKey: .headerNumbers)
        try container.encode(epochs, forKey: .epochs)
        try container.encode(coefficients, forKey: .coefficients)
    }
}
