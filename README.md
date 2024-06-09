# User List App

User List App is a Flutter application that demonstrates the use of clean architecture and the BLoC pattern for state management. The application fetches a list of users from an API and supports infinite scroll with pagination. It also displays detailed user informations.

## Features

- List users with infinite scroll using pagination
- Display user details
- Clean architecture
- BLoC pattern for state management
- Custom font (SF-Pro)


## API Documentation

- Base URL: `https://reqres.in/`
- List Users: `GET /api/users?page={page_number}`
- Get User: `GET /api/users/{user_id}`

## Project Structure

lib/
|-- data/
| |-- models/
| | |-- user_model.dart
| |-- repositories/
| |-- user_repository_impl.dart
|-- domain/
| |-- entities/
| | |-- user.dart
| |-- repositories/
| |-- user_repository.dart
|-- presentation/
| |-- blocs/
| | |-- user_bloc.dart
| | |-- user_event.dart
| | |-- user_state.dart
| |-- pages/
| | |-- user_detail_page.dart
| | |-- user_list_page.dart
| |-- widgets/
| |-- user_list_item.dart
|-- main.dart

## Installation

1. **Clone the repository**:

```bash
git clone https://github.com/manickvenkat29/impactapp.git
cd impactapp

flutter pub get

## Project Structure 

flutter run

## Building for Release
#Android

flutter build apk --release
#iOS

flutter build ios --release