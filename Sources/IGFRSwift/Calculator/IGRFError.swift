public enum IGRFError: Error {
    case invalidLatitude
    case invalidLongitude
    case invalidAltitude
    case dateOutOfRange
    case modelDataUnavailable
    case calculationError(String)
}
