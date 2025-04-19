import Foundation

enum QrScannerState {
    case idle
    case loading
    case success(QrCodeInfo)
    case error(AppError)
}

final class QrScannerViewModel {
    private let repository: QrCodeRepository
    private(set) var state: QrScannerState = .idle

    init(repository: QrCodeRepository) {
        self.repository = repository
    }

    func scanQrCode(input: String) async {
        state = .loading

        do {
            let validatedInput = try QrCodeValidator.validate(input: input)
            let cleanedCode = try QrCodeCleaner.cleanQrCode(validatedInput)
            let info = try await repository.validateQrCode(content: cleanedCode)

            state = .success(info)
        } catch let error as AppError {
            state = .error(error)
        } catch {
            state = .error(.custom(message: "Unexpected error: \(error.localizedDescription)"))
        }
    }
}

// Ensure this file contains the QRCodeViewModel logic and is correctly located here.
