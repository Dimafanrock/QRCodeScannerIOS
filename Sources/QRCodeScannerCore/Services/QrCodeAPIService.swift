import Foundation

protocol QrCodeAPIService {
    func fetchQrCodeInfo(from content: String) async throws -> QrCodeResponse
    func validateQrCode(content: String) async throws -> QrCodeResponse
}
