import XCTest
@testable import QRCodeScannerCore

final class QrScannerViewModelTests: XCTestCase {
    func testSuccessState() async throws {
        let mockRepo = MockQrCodeRepository(result: .success(QrCodeInfo(content: "Mock Data", timestamp: Date())))
        let viewModel = QrScannerViewModel(repository: mockRepo)

        await viewModel.scanQrCode(input: "https://domain.com/code123")

        if case .success(let info) = viewModel.state {
            XCTAssertEqual(info.content, "Mock Data")
        } else {
            XCTFail("Expected success state")
        }
    }

    func testInvalidQrCodeErrorState() async throws {
        let mockRepo = MockQrCodeRepository(result: .failure(.invalidQrCode))
        let viewModel = QrScannerViewModel(repository: mockRepo)

        await viewModel.scanQrCode(input: "invalid_code")

        if case .error(let error) = viewModel.state {
            XCTAssertEqual(error, .invalidQrCode)
        } else {
            XCTFail("Expected error state with invalidQrCode")
        }
    }

    func testCustomErrorState() async throws {
        let mockRepo = MockQrCodeRepository(result: .failure(.custom(message: "Custom Error")))
        let viewModel = QrScannerViewModel(repository: mockRepo)

        await viewModel.scanQrCode(input: "https://domain.com/code123")

        if case .error(let error) = viewModel.state {
            XCTAssertEqual(error, .custom(message: "Custom Error"))
        } else {
            XCTFail("Expected error state with custom error")
        }
    }
}
