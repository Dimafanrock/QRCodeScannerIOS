import Foundation

enum AppError: Error, CustomStringConvertible, Equatable {
    case invalidQrCode
    case networkingNotSupported
    case custom(message: String)

    var description: String {
        switch self {
        case .invalidQrCode:
            return "The QR code is invalid."
        case .networkingNotSupported:
            return "Networking is not supported on this platform."
        case .custom(let message):
            return message
        }
    }

    static func == (lhs: AppError, rhs: AppError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidQrCode, .invalidQrCode),
             (.networkingNotSupported, .networkingNotSupported):
            return true
        case (.custom(let lhsMessage), .custom(let rhsMessage)):
            return lhsMessage == rhsMessage
        default:
            return false
        }
    }
}
