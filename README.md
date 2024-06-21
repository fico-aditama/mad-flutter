# To-Do List App with MVVM Pattern

## Overview of MVVM Pattern

MVVM (Model-View-ViewModel) is a design pattern that separates an application into three main components:
- **Model**: Represents the data and business logic.
- **View**: The UI components visible to the user.
- **ViewModel**: Acts as an intermediary between the Model and View, managing the state and logic.

## How to Run the Application

1. Make sure you have Flutter SDK installed on your machine.
2. Clone this repository.
3. Open the project in your preferred editor.
4. Run `flutter pub get` to install dependencies.
5. Connect a device or start an emulator.
6. Run the application with `flutter run`.

## Reflection

In implementing the MVVM pattern in this Flutter project, I learned the importance of separating concerns between UI, business logic, and data management. Using ViewModel helped in managing state and making the application more scalable. One challenge I faced was understanding the proper flow of data between ViewModel and View, but using Provider and Consumer widgets helped in establishing this connection effectively.
