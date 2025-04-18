import Foundation

struct QrCodeResponse: Decodable {
    let name: String
    let description: String
    let thc: String
    let cbd: String
    let scannedAt: String

    enum CodingKeys: String, CodingKey {
        case name
        case description
        case thc
        case cbd
        case scannedAt = "scanned_at"
    }
}
