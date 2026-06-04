# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]
- Completed Step 7: Advanced Auth. Implemented `OidcAuthStrategy` with PKCE, `CustomHeadersAuthStrategy` for proxies, and `MtlsAuthStrategy` for mutual TLS. Secured certificates with device keystore and integrated all with the API client.
- Completed Step 6: Document Detail Screen. Added `GetDocumentUseCase` and `UpdateDocumentUseCase`, UI for document detail with PDF preview and inline edit, Edit Metadata bottom sheet, Download and Share features.
- Completed Step 5: Document List. Created `DocumentRepository`, local cache with 5-minute TTL, `GetDocumentsUseCase`, and `DocumentListCubit`. Built out the Document Browser screen with infinite scroll, shimmering skeleton loaders, search, and dynamic filter chips.
- Completed Step 4: API DTOs & Retrofit. Created all DTOs via `freezed`/`json_serializable`, defined the Retrofit `PaperlessApiService`, and built `PaperlessApiServiceImpl` for mapping responses to `Result<T>`. Registered via GetIt.
- Completed Step 3: HTTP Client Factory. Implemented `PaperlessHttpClientFactory`, `AuthInterceptor`, `ServerConfig`, and `PaperlessApiClient`. Configured retries and debug logging. Wrote unit tests.
- Completed Step 2: Core Auth. Implemented `UsernamePasswordAuthStrategy` and `ApiTokenAuthStrategy` with robust secure storage and DI. Wrote full unit tests.
- Completed Step 1: Project Scaffold. Generated `paperless_companion` project, setup `pubspec.yaml`, created directory layout, configured `get_it`, `injectable`, `go_router`, and `MaterialApp` with Material 3.
- Initial project setup started.
