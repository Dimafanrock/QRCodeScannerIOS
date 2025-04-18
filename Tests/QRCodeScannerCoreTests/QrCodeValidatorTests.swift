import XCTest
@testable import QRCodeScannerCore

final class QrCodeValidatorTests: XCTestCase {
    func testValidQrCode() async throws {
        let validator = QrCodeValidator()
        let result = try await validator.validate(input: "https://domain.com/code123")
        XCTAssertEqual(result.content, "https://domain.com/code123")
    }

    func testInvalidQrCodeThrowsError() async throws {
        let validator = QrCodeValidator()
        await XCTAssertThrowsError(try await validator.validate(input: "invalid_code")) { error in
            XCTAssertEqual(error as? AppError, .invalidQrCode)
        }
    }
}
