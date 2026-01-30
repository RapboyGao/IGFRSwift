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
}
