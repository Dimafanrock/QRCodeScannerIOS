import Foundation

final class QrCodeRepositoryImpl: QrCodeRepository {
    private let apiService: QrCodeAPIService

    init(apiService: QrCodeAPIService) {
        self.apiService = apiService
    }

    func validateQrCode(content: String) async throws -> QrCodeInfo {
        let response = try await apiService.fetchQrCodeInfo(from: content)

        return QrCodeInfo(
            content: """
            Name: \(response.name)
            THC: \(response.thc)%
            CBD: \(response.cbd)%
            Description: \(response.description)
            """,
            timestamp: ISO8601DateFormatter().date(from: response.scannedAt) ?? Date()
        )
    }
}
