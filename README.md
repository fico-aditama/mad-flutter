# Phone Store App

## Overview

The Phone Store App is a simple mobile application developed using Flutter. It allows users to browse a list of phones available for sale, add phones to a shopping cart, and view the cart contents. This project was developed to showcase fundamental concepts in mobile app development, including software design principles, usability testing, and basic decoupling techniques.

## Purpose

The purpose of this app is to provide a basic yet functional platform for users to view and manage a list of phones for sale. It addresses the need for a straightforward app to demonstrate key concepts in mobile application development.

## Design

### Core Features

- **Phone List:** Displays a list of phones with basic details including name, brand, price, and an image.
- **Add to Cart:** Allows users to add phones to a shopping cart.
- **Cart Screen:** Displays the contents of the shopping cart and allows users to remove items.

### Software Design Principles

- **MVVM Pattern:** The app uses the Model-View-ViewModel (MVVM) pattern to separate concerns.
  - **Model:** Represents the phone data.
  - **ViewModel:** Manages the data and logic for the phone list and cart.
  - **View:** The UI components that interact with the user.

- **Separation of Concerns:** The app separates data handling from UI rendering to maintain a clean architecture.

## Development Process

1. **Project Setup:** Created a new Flutter project and set up the initial structure.
2. **Model Creation:** Defined the `Phone` model to represent phone data.
3. **ViewModel Implementation:** Implemented the `PhoneViewModel` to manage the list of phones and the shopping cart.
4. **UI Development:** Built the user interface for listing phones, adding to the cart, and viewing the cart.
5. **Usability Testing:** Conducted basic usability testing to gather feedback on the app's functionality and interface.

## Usability Testing

- **Participants:** Three users tested the app.
- **Feedback:**
  - The interface was generally easy to navigate.
  - Users appreciated the simplicity of the design.
  - Some users suggested adding more phone details (e.g., specifications).

**Changes Based on Feedback:**
- Updated UI to better display phone information.
- Improved the user experience by making the cart screen more interactive.

## Challenges Faced

- **State Management:** Handling state changes between the phone list and cart required careful attention.
- **UI Design:** Ensuring a responsive design that works well on different screen sizes.

## Screenshots

### Phone List Screen
![Phone List Screen](screenshots/phone_list.png)

### Cart Screen
![Cart Screen](screenshots/cart.png)

## Source Code

The source code for the Phone Store App is available on [GitHub](https://github.com/yourusername/phone_store_app).

## Submission

Please ensure you have followed the instructions and included all necessary files before submitting your project. If you have any questions or need further assistance, feel free to reach out.

---

Thank you for reviewing my project!

