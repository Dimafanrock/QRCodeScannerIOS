import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

final class QrCodeAPIServiceImpl: QrCodeAPIService {

    func fetchQrCodeInfo(from content: String) async throws -> QrCodeResponse {
        return try await validate(content: content)
    }

    func validateQrCode(content: String) async throws -> QrCodeResponse {
        guard let url = URL(string: "\(NetworkConfig.baseURL)/qr_codes/\(content)") else {
            throw AppError.custom(message: "Invalid URL")
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(NetworkConfig.apiKey, forHTTPHeaderField: NetworkConfig.apiKeyHeader)

        #if canImport(FoundationNetworking)
        let semaphore = DispatchSemaphore(value: 0)
        var responseData: Data?
        var urlResponse: URLResponse?
        var error: Error?

        URLSession.shared.dataTask(with: request) { data, resp, err in
            responseData = data
            urlResponse = resp
            error = err
            semaphore.signal()
        }.resume()

        semaphore.wait()

        if let error = error {
            throw AppError.custom(message: error.localizedDescription)
        }

        guard let data = responseData,
              let httpResp = urlResponse as? HTTPURLResponse,
              (200...299).contains(httpResp.statusCode) else {
            throw AppError.custom(message: "HTTP error")
        }

        do {
            return try JSONDecoder().decode(QrCodeResponse.self, from: data)
        } catch {
            throw AppError.custom(message: "Failed to decode QR Code info: \(error.localizedDescription)")
        }

        #else
        throw AppError.networkingNotSupported
        #endif
    }

    private func validate(content: String) async throws -> QrCodeResponse {
        let trimmed = content.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            throw AppError.invalidQrCode
        }
        return try await validateQrCode(content: trimmed)
    }
}
