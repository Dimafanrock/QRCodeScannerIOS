import Foundation

let apiService = QrCodeAPIServiceImpl()
let repository = QrCodeRepositoryImpl(apiService: apiService)
let viewModel = QrScannerViewModel(repository: repository)

print("Enter QR Code:")

if let input = readLine() {
    Task {
        await viewModel.scanQrCode(input: input)

        switch viewModel.state {
        case .idle:
            print("Idle state.")
        case .loading:
            print("Loading...")
        case .success(let info):
            print("✅ QR Code Info:")
            print("Content: \(info.content)")
            print("Scanned at: \(info.timestamp)")
        case .error(let error):
            print("❌ Error: \(error.description)")
        }

        exit(0)
    }

    dispatchMain()
}



