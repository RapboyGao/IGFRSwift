// MARK: - 增强的错误类型系统
public enum IGRFCalculationError: Error, Sendable {
    // 输入参数错误
    case invalidLatitude               // 纬度超出[-90°, 90°]
    case invalidAltitude               // 海拔高度为负值
    case dateOutOfRange(modelYears: ClosedRange<Double>) // 日期超出模型支持范围
    case unsupportedModel(version: Int) // 不支持的模型版本
    
    // 数据完整性错误
    case emptyModelData                // 模型数据为空
    case coefficientCountMismatch      // 系数数量与模型阶数不匹配
    case invalidCoefficientData        // 系数数据格式错误
    
    // 计算过程错误
    case interpolationError(reason: String) // 时间插值失败
    case legendreCalculationFailed     // 勒让德多项式计算失败
    case divisionByZero                // 除零错误
    case indexOutOfBounds(description: String) // 下标越界
    case numericalInstability          // 数值不稳定
    
    // 运行时错误
    case concurrentAccess              // 并发访问错误
    case memoryAllocationFailed        // 内存分配失败
    
    public var localizedDescription: String {
        switch self {
        case .invalidLatitude:
            return "纬度值必须在-90°到90°之间"
        case .invalidAltitude:
            return "海拔高度不能为负值"
        case .dateOutOfRange(let range):
            return "日期必须在\(range.lowerBound)-\(range.upperBound)年之间"
        case .unsupportedModel(let v):
            return "不支持的模型版本: v\(v)，当前仅支持v14"
        case .emptyModelData:
            return "模型数据为空，请检查初始化"
        case .coefficientCountMismatch:
            return "球谐系数数量与模型阶数不匹配"
        case .invalidCoefficientData:
            return "系数数据格式错误，请验证模型文件"
        case .interpolationError(let reason):
            return "时间插值失败: \(reason)"
        case .legendreCalculationFailed:
            return "伴随勒让德多项式计算失败，请检查θ值"
        case .divisionByZero:
            return "计算过程中发生除零错误"
        case .indexOutOfBounds(let desc):
            return "下标越界: \(desc)"
        case .numericalInstability:
            return "检测到数值不稳定，请检查输入参数"
        case .concurrentAccess:
            return "检测到并发访问，请使用串行队列"
        case .memoryAllocationFailed:
            return "内存分配失败，请减少计算规模"
        }
    }
}
