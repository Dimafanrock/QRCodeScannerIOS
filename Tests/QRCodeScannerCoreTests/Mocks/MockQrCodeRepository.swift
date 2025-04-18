import Foundation
@testable import QRCodeScannerCore

final class MockQrCodeRepository: QrCodeRepository {
    private let result: Result<QrCodeInfo, AppError>

    init(result: Result<QrCodeInfo, AppError>) {
        self.result = result
    }

    func validateQrCode(content: String) async throws -> QrCodeInfo {
        switch result {
        case .success(let info):
            return info
        case .failure(let error):
            throw error
        }
    }
}
