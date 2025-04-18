import Foundation

class DependencyContainer {
    static let shared = DependencyContainer()

    func resolveQrCodeRepository() -> QrCodeRepository {
        return QrCodeRepositoryImpl(apiService: resolveQrCodeAPIService())
    }

    func resolveQrCodeAPIService() -> QrCodeAPIService {
        return QrCodeAPIServiceImpl()
    }
}
