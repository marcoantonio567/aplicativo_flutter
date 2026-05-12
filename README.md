# project_app_flutter

Flutter application with layered architecture, light/dark theme, centralized navigation, and examples of reusable UI components.

## Overview
- Application entry in `lib/main.dart` (`lib/main.dart:10`).

- `MaterialApp` configured in `lib/scenes/view/app_view.dart:23` with light/dark theme.

- Centralized navigation via `AppCoordinator` in `lib/utils/navigation/app_coordinator.dart:11`.

- Dark mode preference persisted with `shared_preferences` in `lib/scenes/services/settings/app_settings_service.dart:6`.

## Requirements
- Flutter SDK (stable channel)
- Dart `>=3.8.1` (defined in `pubspec.yaml`)

## How to Run
- Install dependencies: `flutter pub get`
- Run on device/emulator: `flutter run`
- Analyze code: `flutter analyze`
- Run tests (if applicable): `flutter test`

## Project Structure
- `lib/Components`: library of reusable UI components (buttons, inputs, lists, avatars, banners, etc.).

- `lib/model`: domain models (`notes`, `auth`).

- `lib/repository`: data access interfaces and persistence rules (`notes`, `settings`, `auth`).

- `lib/scenes`

- `view`: pages and screens (Login, Home, Notes, Terms).

- `view_model`: presentation logic (MVVM) for each scene.

- `services`: data services (e.g., `NotesService`, `AppSettingsService`).

- `factory`: factories for instantiating screens with their dependencies.

- `lib/shared`: theme, styles, colors, spacing, and UI utilities.

- `lib/utils`: various utilities (e.g., `navigation/AppCoordinator`).

## Initialization Flow
- `main()` creates `AppCoordinator` and `AppViewModel`, loads preferences, and initializes the `AppView` (`lib/main.dart:10-16`).

- `AppView` observes `ThemeMode` and configures `MaterialApp` (`lib/scenes/view/app_view.dart:20-30`).

- The initial screen is created via the Login factory (`lib/scenes/factory/login_factory.dart`).

## Light/Dark Theme
- Theme state in `AppViewModel` (`lib/scenes/view_model/app/app_view_model.dart:6`).

- Theme loading and switching with persistence (`lib/scenes/view_model/app/app_view_model.dart:10-18`).

- Persistence via `shared_preferences` (`lib/scenes/services/settings/app_settings_service.dart:6-13`).

## Navigation
- Coordinator maintains `navigatorKey` and navigation methods (`lib/utils/navigation/app_coordinator.dart:12,17-26,29-37,39-47,49-58`).

- Helpers in `lib/shared/navigation_helper.dart`.

## Sample Notes and Data
- `NotesService` provides an in-memory store for note CRUD operations (`lib/scenes/services/notes/notes_service.dart`).

- `NotesListView` and `NoteDetailView` demonstrate basic flow for searching, creating, editing, and deleting.

## Build
- Android: `flutter build apk`
- iOS: `flutter build ios` (macOS and Xcode required)
- Web: `flutter build web`
- Desktop: `flutter build windows` / `flutter build macos` / `flutter build linux`

## Conventions
- MVVM pattern in scenes: `view` + `view_model` + `service/repository` + `factory`.

- Components in `lib/Components` follow the API with `ViewModel` for configuration.

License
- Private project; adjustments as needed.
