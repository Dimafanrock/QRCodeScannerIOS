import SwiftUI
import QRCodeScannerCore

struct ResultView: View {
    @ObservedObject var viewModel: QRCodeViewModel

    var body: some View {
        VStack {
            if let response = viewModel.apiResponse {
                Text("Response: \(response.data)")
            } else {
                Text("No data available.")
            }
        }
        .navigationTitle("Result")
    }
}
