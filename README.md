# DeveloperHub Flutter Login Application 🚀

Welcome to the **DeveloperHub Flutter Login Application**. This project is a state-of-the-art, premium cross-platform application developed as part of **Assignment 1 (Weeks 1, 2, & 3)**. It showcases an elegant Glassmorphic UI, robust form validation, smooth navigation, and a modern responsive dashboard layout.

---

## ✨ Features

### 1. Modern Glassmorphic UI 🎨
- **Theme**: Premium slate dark mode styling with harmonized colors (deep slate, rich indigo, and violet gradients).
- **Responsive Layout**: Designed to look stunning on both desktop/web screens and mobile devices.
- **Micro-Animations**: Features custom visual feedback for text inputs, loading spinner states, and sleek interactive buttons.

### 2. Form Validation 🛡️
- **Email Validation**: 
  - Checks if the field is empty.
  - Validates correct email format using standard regular expressions (`^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$`).
- **Password Validation**:
  - Checks if the field is empty.
  - Ensures password security with a minimum character length of **6 characters**.
- **Interactive Feedback**: Dynamic input validation states with error borders and real-time instructions.

### 3. Smooth Navigation 🧭
- Uses the standard **Flutter Navigation System** (`Navigator.push()` and `Navigator.pop()`) to navigate seamlessly between screens.
- **Login Screen ➡️ Home Screen**: Passes authenticated email dynamically to customize the dashboard greeting.
- **Home Screen ➡️ Login Screen**: Clean logout flow popping the route off the stack safely.

### 4. High-Fidelity Dashboard 📊
- Custom gradient welcome banner that extracts and capitalizes the user's name from their email address.
- Three elegant metrics cards with modern symbols representing **Assignments Completed**, **Learning Hours**, and **Skill Score**.

---

## 🛠️ Tech Stack & Architecture

- **Core**: [Flutter 3.38.3](https://flutter.dev) & [Dart 3.10.1](https://dart.dev)
- **Styling**: Modern Material 3 guidelines with rich typography and rounded slate containers.
- **State Management**: Stateful widgets with dynamic state updates (`setState`).
- **Structure**: Clean split architecture dividing code into screen components:
  ```text
  lib/
  ├── main.dart             # Application Entry Point & Theme Settings
  └── screens/
      ├── login_screen.dart # Login Form UI and Validation Logic
      └── home_screen.dart  # Home Screen / Dashboard with Metrics Cards
  ```

---

## 🚀 How to Run Locally

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

## 📸 Interactive Showcase & Validation

Here is a visual breakdown of the application flow:

1. **Empty Fields Validation**: Pressing the button with empty inputs highlights the errors instantly.
2. **Invalid Email Validation**: Entering an incorrect email format triggers the standard regex validator error.
3. **Successful Login & Personalized Greeting**: Successful entry redirects to the home screen where the greeting shows the personalized user name.

Developed with ❤️ for DeveloperHub Internship Assignment 1.
