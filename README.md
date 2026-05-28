# DeveloperHub Flutter Application

Welcome to the **DeveloperHub Flutter Application**. This project is a state-of-the-art, premium cross-platform application developed as part of **Assignment 1 & 2 (Weeks 1 to 3)**. It showcases an elegant UI, robust form validation, smooth navigation, dynamic state management, and persistent local storage.

---

## Features

### 1. Modern UI
- **Theme**: Premium slate dark mode styling with harmonized colors (deep slate, rich indigo, and violet gradients).
- **Responsive Layout**: Designed to look stunning on both desktop/web screens and mobile devices.
- **Micro-Animations**: Features custom visual feedback for text inputs, loading spinner states, and sleek interactive buttons.

### 2. Form Validation
- **Email Validation**: 
  - Checks if the field is empty.
  - Validates correct email format using standard regular expressions.
- **Password Validation**:
  - Checks if the field is empty.
  - Ensures password security with a minimum character length of 6 characters.
- **Interactive Feedback**: Dynamic input validation states with error borders and real-time instructions.

### 3. Smooth Navigation
- Uses the standard **Flutter Navigation System** to navigate seamlessly between screens.
- **Login Screen to Dashboard**: Passes authenticated email dynamically to customize the dashboard greeting.
- **Dashboard to Login Screen**: Clean logout flow popping the route off the stack safely.
- **Dashboard to Interactive Modules**: Push and pop navigation to the sub-applications.

### 4. Interactive Counter Module (Week 4 State Management & Persistence)
- **Dynamic State**: Manages integer counter value utilizing standard reactive `setState`.
- **Local Storage**: Automatically persists and restores the count value on app restart using `SharedPreferences`.
- **UI**: Circular action buttons for incrementing and decrementing the count with custom outline borders.

### 5. Persistent To-Do Task Board (Week 5 Simple List App)
- **Add Tasks**: Seamless form input to add new tasks.
- **Dynamic List**: Lists all active tasks using a dynamic, scrollable `ListView`.
- **Delete Tasks**: Allows removing individual tasks, immediately updating the active list layout.
- **Local Storage**: String list serialization saving and loading task descriptions persistently via `SharedPreferences`.

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
      ├── login_screen.dart # Login Form UI and Validation Logic
      ├── home_screen.dart  # Home Dashboard with Interactive Module Cards
      ├── counter_screen.dart # Persistent State Counter
      └── todo_screen.dart  # Persistent To-Do Task List
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

---

## Interactive Showcase & Validation

Here is a visual breakdown of the application flow:

1. **Login Validation**: Empty input and incorrect formats trigger errors instantly.
2. **Dashboard Overview**: Redirects to the home screen where users can see metrics cards and choose interactive modules.
3. **State Counter**: Increment and decrement buttons change the counter value, persisting value across navigations and restarts.
4. **To-Do Task Board**: Allows list addition and deletion with immediate SharedPreferences state sync.
