import SwiftUI
import QRCodeScannerCore

@main
struct QRCodeScannerApp: App {
    var body: some Scene {
        WindowGroup {
            ScanView(viewModel: QRCodeViewModel())
        }
    }
}
