import Foundation

struct QrCodeValidator {
    static func validate(input: String) throws -> String {
        let trimmed = input.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            throw AppError.invalidQrCode
        }
        return trimmed
    }
}

struct QrCodeCleaner {
    static func cleanQrCode(_ input: String) throws -> String {
        let trimmedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let lastComponent = trimmedInput.split(separator: "/").last, !lastComponent.isEmpty else {
            throw AppError.invalidQrCode
        }
        return String(lastComponent)
    }
}
