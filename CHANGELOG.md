# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.6] - 2026-02-02

### Added
- **Cinematic Splash:** Rebuilt the Splash View with a staggered animation system (Logo bounce, tagline slide-in, and dynamic letter-spacing).
- **Optimization:** Enabled R8 Minification and Resource Shrinking for smaller, faster Android builds.
- **Safety:** Added production-ready logic to automatically disable debug tools (Device Preview) in release builds.
- **Responsive Design:** Introduced `SizeConfig` utility for screen-aware scaling.
- **Adaptive UI:** Updated `AppStyles` to use proportional font sizes based on device width (reference: 375px).
- **UX:** Implemented "Scale-Down Only" strategy to prevent oversized UI elements on large devices while maintaining readability on small ones.

### Changed
- **Architecture:** Decoupled `MatchCubit` from Hive by abstracting persistence into the `MatchRepo`.
- **Persistence:** Improved data synchronization—manual team adjustments (Drag & Drop) are now instantly saved to the database.
- **Performance:** Implemented **Optimistic Updates** in `PlayersCubit` for instant UI feedback when editing players.
- **Responsiveness:** Converted static UI heights to dynamic getters (e.g., Nav Bar and SnackBar positioning) for perfect scaling across all device sizes.
- **Organization:** Moved `MatchResultDialog` to the Match feature for better architectural cohesion.
- **UI:** Refactored `SquadCounterHeader` to support directional animations (Slide Up for increment, Slide Down for decrement) with `easeOutBack` curves.
- **UI:** Cleaned up `PlayerSelectionView` logic by simplifying state handling and extracting content sub-widgets.

### Fixed
- **UI Bug:** Resolved an issue where the SnackBar would overlap the floating navigation bar on devices with large safe areas.
- **Logic:** Fixed a bug where manual team changes were lost if the app was closed before finishing a match.

## [1.0.5] - 2026-01-27

### Added
- **Core UI:** Introduced `HapticListView`, a high-performance scrolling component. Features adaptive haptic thresholds based on `scrollDelta` velocity, `Stopwatch`-based throttling (40ms), and overscroll feedback.
- **UX:** Unified scrolling mechanics across Player Selection, Generated Teams, and History views using `HapticListView`.
- **UX:** Added Drag-and-Drop functionality for team adjustments in `GeneratedTeamsView`.
- **UX:** Implemented "Safety Hatch" back button in `GeneratedTeamsView` to prevent accidental data loss.
- **UX:** Real-time feedback in `PlayerSelectionView` with custom SnackBars and Empty State widgets.
- **Logic:** `PlayersCubit` now includes input polishing (automatic name trimming).
- **Logic:** `MatchCubit` now supports Session Recovery, persisting generated teams state.
- **Logic:** Global `HistoryCubit` for efficient match history management across the app.
- **Assets:** Integrated custom Rubik font family and application-specific SVG icons.
- **Documentation:** Created comprehensive `README.md` (with screenshots & logo) and `PROJECT_SUMMARY.md`.

### Changed
- **Architecture:** Refactored `HistoryCubit` to eliminate redundant providers, ensuring a single source of truth.
- **Performance:** Optimized app startup by parallelizing Hive box opening using `Future.wait`.
- **Performance:** Reduced widget rebuild costs by pre-calculating semi-transparent colors in `AppColors` and using `const` constructors.
- **Configuration:** Updated Android build to use Java 17 and modern Kotlin `compilerOptions`.
- **Configuration:** Centralized asset paths and Hive box names in `Constants`.
- **Branding:** Project renamed from "Ta2sima" to "**Taqsema**".

### Fixed
- **Build:** Resolved Android build warnings regarding Java 8 obsolescence and deprecated `KotlinJvmOptions`.

## [1.0.0] - Initial Release - 2026-01-25

### Added
- Initial project structure based on Clean Architecture (Feature-First) and MVVM.
- **Data Layer:** Hive (NoSQL) database setup for local persistence of Players and Matches.
- **State Management:** Flutter Bloc (Cubit) integration.
- **Navigation:** Routing setup using `GoRouter`.
- **Dependency Injection:** Service locator setup using `GetIt`.
- Basic CRUD operations for Players.
- Basic Team Generation logic.
