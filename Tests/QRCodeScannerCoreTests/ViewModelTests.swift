// Tests/QRCodeScannerCoreTests/ViewModelTests.swift
import XCTest
@testable import QRCodeScannerCore

final class ViewModelTests: XCTestCase {
    func testFetchSuccess() async throws {
        let mockRepo = MockQrCodeRepository(result: .success(QrCodeInfo(data: "Mock Data")))
        let viewModel = QrScannerViewModel(repository: mockRepo)
        
        await viewModel.fetch(rawCode: "http://domain.com/code123")
        
        XCTAssertNotNil(viewModel.info)
        XCTAssertNil(viewModel.error)
    }
}

// Mock implementation of QrCodeRepository
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
