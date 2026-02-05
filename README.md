<p align="center">
  <img src="assets/images/logo_full.png" width="150" alt="Taqsema Logo" />
</p>

# Taqsema (تقسيمة) ⚽

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Hive](https://img.shields.io/badge/Hive-NoSQL-orange?style=for-the-badge)
![Bloc](https://img.shields.io/badge/State%20Management-Bloc-blueviolet?style=for-the-badge)

**Taqsema** is a professional football match organizer and team balancer built with Flutter. It solves the common headache of organizing casual matches by managing players, generating fair teams randomly, and tracking match history.

Built with a focus on **Clean Architecture**, **Performance**, and **Premium UX**.

## 📥 Download

[![Download APK](https://img.shields.io/badge/Download-APK-green?style=for-the-badge&logo=android)](https://ishortn.ink/taqsema-APKPure)

## ✨ Features

### 🏃‍♂️ Player Management
*   **Roster Control:** Add, edit, and delete players with ease.
*   **Media Integration:** Assign photos to players via Camera or Gallery with built-in cropping.
*   **Smart Interactions:** Custom `HapticListView` with adaptive scrolling feedback and swipe-to-delete.

### ⚖️ Team Generation
*   **Fair Balancing:** Algorithm to shuffle and split the selected pool into two equal squads.
*   **Interactive Adjustments:** Drag-and-drop players between teams to fine-tune the lineup.
*   **Safety Hatch:** "Clear Match" functionality to reset the current session.

### 📜 Match History & Persistence
*   **Auto-Save:** Never lose a match result. Games are saved locally using Hive.
*   **Session Recovery:** If the app closes mid-game, it re-opens right where you left off.
*   **History Log:** Review past match dates, scores, and lineups.

### 💎 Premium UX/UI
*   **Haptic Engine:** Custom-built tactile feedback that adapts to scroll velocity and user actions.
*   **Edge-to-Edge:** Modern UI design fully utilizing the screen real estate.
*   **Dark Mode:** Sleek, battery-friendly interface.

## 📸 Screenshots

| Player Selection | Team Generation | Result Dialog | Match History |
| :---: | :---: | :---: | :---: |
| ![Selection](assets/screenshots/player_selection.png) | ![Teams](assets/screenshots/generated_teams.png) | ![Result](assets/screenshots/result_dialog.png) | ![History](assets/screenshots/history.png) |

## 🛠️ Tech Stack & Architecture

This project strictly follows **Clean Architecture** (Feature-First) and **MVVM** principles.

*   **Framework:** Flutter (Dart)
*   **State Management:** BLoC (Cubits)
*   **Local Database:** Hive (NoSQL)
*   **DI:** GetIt (Service Locator)
*   **Routing:** GoRouter

### Folder Structure
```
lib/
├── core/                  # Shared utilities, widgets (HapticListView), and config
├── features/
│   ├── players/           # Player CRUD logic (Data & Presentation)
│   ├── match/             # Team generation & Active session logic
│   ├── history/           # Match persistence logic
│   └── home/              # Main dashboard
└── main.dart              # Entry point
```

## 🚀 Getting Started

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/taqsema.git
    ```
2.  **Install dependencies:**
    ```bash
    cd taqsema
    flutter pub get
    ```
3.  **Run the app:**
    ```bash
    flutter run
    ```

## 🧪 Code Quality
*   **Strict Linting:** Adheres to Flutter best practices (`avoid_print`, `prefer_single_quotes`).
*   **Optimized Rendering:** Uses `const` constructors and pre-calculated colors for 60fps performance.
*   **Type Safety:** Fully typed codebase with immutable models (`Equatable`).

## 👨‍💻 Development Journey

This project serves as a practical implementation of advanced Software Engineering concepts. It demonstrates:
*   Separation of Concerns (Data vs Domain vs Presentation).
*   Reactive State Management.
*   Local Persistence strategies.
*   Custom Physics/Gesture handling in Flutter.

---
*Built with ❤️ using Flutter*
