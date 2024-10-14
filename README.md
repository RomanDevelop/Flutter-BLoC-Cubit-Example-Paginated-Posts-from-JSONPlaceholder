

Title: Flutter Pagination with Cubit and Repository Pattern

Description: This project is a Flutter application demonstrating pagination of posts using the Cubit pattern and the Repository pattern. The app fetches post data from the API https://jsonplaceholder.typicode.com and displays it in a list format. It also includes the option to switch to mock data for testing purposes using the Factory pattern.

Key Features:

Cubit: State management using Cubit for handling post loading and UI state management.
Repository Pattern: Encapsulation of data access logic through the PostRepository interface.
Factory Pattern: Creation of different repository implementations (real API and mock) for flexibility and testability.
Pagination: Loads posts in increments of 10 at a time with the ability to fetch more data.
Usage:

Clone the repository: git clone <url>
Install dependencies: flutter pub get
Run the app: flutter run
Technologies:

Flutter
Dart
Bloc (Cubit)
HTTP
License: MIT

