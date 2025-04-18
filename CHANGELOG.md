# Changelog

## [Unreleased]

### Added
- `NetworkConfig` for configurable base URL.
- `QrCodeValidator` for input sanitization.
- Logging in `QrCodeAPIServiceImpl`.

### Changed
- Refactored `QrCodeRepositoryImpl` to eliminate duplicate logic.
- Updated `AppError` with additional cases and a convenience initializer.
- Refactored `QrScannerViewModel` to use `UIState` and remove `@Published`.
- Improved error handling for decoding failures in `QrCodeAPIServiceImpl` to provide more descriptive error messages.

### Fixed
- Improved error handling and type consistency across layers.
- Sanitized URL parameters to prevent potential security issues.
- Fixed an issue in `QrCodeAPIServiceImpl` where invalid URLs were not properly handled, leading to potential crashes.
- Resolved a bug where network errors were not correctly mapped to `AppError.networkError`.

### Issues
- #101: Refactor `QrCodeRepositoryImpl` to improve maintainability.
- #102: Add input validation for QR code scanning.
- #103: Implement centralized logging for API services.

### Bugs
- #201: Fix crash when scanning invalid QR codes.
- #202: Resolve incorrect error mapping in `AppError`.
- #203: Address inconsistent UI state updates in `QrScannerViewModel`.
