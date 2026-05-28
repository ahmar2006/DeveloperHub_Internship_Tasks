# DeveloperHub Flutter Application

Welcome to the **DeveloperHub Flutter Application**. This project is a state-of-the-art, premium cross-platform application developed as part of **Assignment 1 & 2 (Weeks 1 to 3) & Final Project**. It showcases an elegant UI, robust form validation, smooth navigation, dynamic state management, local database persistence, and an animated launch splash screen.

---

## Features

### 1. Animated Splash Screen (Bonus Challenge)
- **Visuals**: Ambient dark gradient, pulsing neon energy bolt icon with outer shadow glow effects, and a modern smooth linear loading bar.
- **Auto-Navigation**: Displays for 2.2 seconds to establish premium brand identity, then automatically transitions to the validated Login Screen via root-replacing route transitions.

### 2. Form Validation Login Screen
- **Theme**: Premium slate dark mode styling with harmonized colors (deep slate, rich indigo, and violet gradients).
- **Responsive Layout**: Designed to look stunning on both desktop/web screens and mobile devices.
- **Validation**: 
  - Regex-based email checking.
  - Minimum 6-character length validation for passwords.
- **Interactive Feedback**: Dynamic input validation states with error borders and real-time instructions.

### 3. Integrated Performance Dashboard
- **Welcome Banner**: Custom banner extracting and capitalizing the user's name dynamically from their email.
- **Metrics Overview**: Metric widgets for Assignments Completed, Active Learning Hours, and Skill Score.
- **Interactive Suite**: High-fidelity modular card triggers to navigate to sub-modules.

### 4. Interactive Counter Module
- **Dynamic State**: Manages integer counter value utilizing standard reactive `setState`.
- **Local Storage**: Automatically persists and restores the count value on app restart using `SharedPreferences`.
- **UI**: Circular action buttons for incrementing and decrementing the count with custom outline borders.

### 5. Advanced Task Board (Final Project Task Management App)
- **Custom AppBar Actions**: Custom action trigger button in the AppBar showing an elegant modal bottom sheet sheet to input and add new tasks.
- **Task Completion Status**: Clickable circular status icons next to tasks to toggle their completion status. Completed tasks instantly transition with text strike-through decorations and dim grey font colors.
- **Interactive Stats**: Dynamic counters rendering Completed Tasks vs Remaining Active Tasks.
- **SharedPreferences Serialization**: Advanced JSON string list encoding/decoding (`dart:convert`) to serialize and preserve task titles and completion flags across app restarts.
- **Delete Actions**: Standard trash icons to cleanly purge tasks instantly.

---

## Tech Stack & Architecture

- **Core**: Flutter & Dart
- **State Management**: Reactive state changes via `setState`
- **Local Storage**: SharedPreferences API
- **Structure**:
  ```text
  lib/
  ├── main.dart             # Application Entry Point & Theme Settings
  └── screens/
      ├── splash_screen.dart # Pulsing Splash Screen Launch Point
      ├── login_screen.dart # Login Form UI and Validation Logic
      ├── home_screen.dart  # Home Dashboard with Interactive Module Cards
      ├── counter_screen.dart # Persistent State Counter
      └── todo_screen.dart  # Upgraded Task Management Board
  ```

---

## How to Run Locally

### Prerequisites
Make sure you have Flutter installed and set up on your machine. You can verify your environment with:
```bash
flutter doctor
```

### Steps to Run

1. **Clone/Navigate to the Repository Workspace**:
   ```bash
   cd week_1_2_3
   ```

2. **Fetch Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Check Connected Devices**:
   ```bash
   flutter devices
   ```

4. **Run on Chrome (Web Dev Server)**:
   ```bash
   flutter run -d chrome
   ```

5. **Run on Desktop (Windows)**:
   ```bash
   flutter run -d windows
   ```
