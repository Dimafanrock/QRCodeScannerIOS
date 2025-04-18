git@github.com:Dimafanrock/QRCodeScannerIOS.git
# QR Code Scanner Core - Swift CLI

## Project Overview

This project is a command-line application built in Swift that allows you to scan QR codes. It retrieves data from an external API (`qrsecurea.website`) using an async/await pattern in Swift. The app handles the following:

- **Validates the QR code content** to ensure it is not empty or malformed.
- **Fetches data** from a remote server using a RESTful API.
- **Decodes the data** into a structured model for further use (including details like `name`, `description`, `THC`, `CBD`, etc.).

The application was developed using a modular architecture, following the principles of MVVM (Model-View-ViewModel) for clean code and testability.

## Project Structure

```
QRCodeScannerCore/
├── CHANGELOG.md           # Changelog for the project updates
├── Package.swift          # Swift Package Manager manifest file
├── Sources/               # Source code directory
│   └── QRCodeScannerCore/
│       ├── Core/          # Core business logic (e.g., Dependency Injection)
│       ├── Errors/        # Error handling (e.g., AppError)
│       ├── Models/        # Data models (e.g., QrCodeResponse, QrCodeInfo)
│       ├── Services/      # Services to interact with the API (e.g., QrCodeAPIServiceImpl)
│       ├── Utils/         # Utility classes (e.g., QrCodeValidator, QrCodeCleaner)
│       └── ViewModels/    # ViewModel (e.g., QrScannerViewModel)
├── Tests/                 # Unit tests for various components
│   └── QRCodeScannerCoreTests/
│       ├── QrCodeValidatorTests.swift
│       ├── QrScannerViewModelTests.swift
│       └── ViewModelTests.swift
├── .gitignore             # Git ignore file for ignoring unnecessary files
└── README.md              # Project documentation (this file)
```

## Features

- **QR Code Validation:**  
  The `QrCodeValidator` class ensures that the QR code content is valid by checking for empty or malformed content.

- **Fetching QR Code Data:**  
  The `QrCodeAPIServiceImpl` class manages network requests to fetch QR code data from the API. It handles the construction of the request URL and setting necessary headers.

- **ViewModel Logic:**  
  The `QrScannerViewModel` class is used to manage the scanning logic, including validating the QR code and storing the scanned data in the appropriate state. It uses the repository pattern to communicate with the service layer.

- **Repository Layer:**  
  `QrCodeRepositoryImpl` abstracts the fetching of data from the API service and processes the response into `QrCodeInfo` objects. It decodes the necessary information such as THC, CBD, and description.

## Requirements

- Swift 5.4 or later
- macOS or Linux (Linux setup uses `FoundationNetworking` for network requests)

## Setup

1. **Clone the repository:**
    ```bash
    git clone <repository_url>
    cd QRCodeScannerCore
    ```

2. **Install dependencies:**
    ```bash
    swift build
    ```

3. **Run the CLI application:**
    ```bash
    swift run
    ```

## Tests

Unit tests are written using `XCTest`. To run the tests, execute the following command:

```bash
swift test
```

## Code Structure

### Services

- `QrCodeAPIServiceImpl`: This class implements the logic for interacting with the QR code API. It sends requests and processes responses to fetch QR code data.

### ViewModel

- `QrScannerViewModel`: The ViewModel responsible for managing the app state, validating the QR code, and updating the UI state (e.g., loading, error, or success).

### Models

- `QrCodeResponse`: The data model representing the response from the API containing information like `name`, `description`, `thc`, `cbd`, and `scannedAt`.
- `QrCodeInfo`: Represents the formatted and validated QR code data.

### Utilities

- `QrCodeValidator`: Validates that the QR code content is valid.
- `QrCodeCleaner`: Cleans and processes QR code input, such as extracting the last component from a URL.

### Error Handling

- `AppError`: A custom error type used for managing errors throughout the application, including validation and networking errors.

## License

This project is open source and available under the MIT License.