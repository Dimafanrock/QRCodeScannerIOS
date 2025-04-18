import Foundation

protocol QrCodeRepository {
    func validateQrCode(content: String) async throws -> QrCodeInfo
}
