# reels

# Reels Display App - Flutter Test Project

This is a sample Flutter application developed as part of a technical assessment for a mobile developer position. The app displays video reels in a vertical scrolling format similar to Instagram Reels or TikTok.

## Features

- Vertical video scrolling interface
- Caching mechanism for improved performance
- Clean architecture with BLoC state management
- Responsive UI design

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- **Flutter SDK**: Version 3.7.2 or higher
- **Dart SDK**: Included with Flutter
- **Android Studio** (for mobile development)
- **Git** (for cloning the repository)

### Flutter Installation

If you don't have Flutter installed, follow the official installation guide:

- [Flutter Installation Guide](https://docs.flutter.dev/get-started/install)

## Installation

### 1. Clone the Repository

- git clone https://github.com/ahmadsultan39/reels.git
- cd reels

### 2. Install Dependencies

- flutter pub get

### 3. Generate Required Files

- dart run build_runner build
- 
## Running the Project (Android)

### For Development

- flutter run -d android

### For Production Build (APK)

- flutter build apk --release

## Project Structure

lib/
├── app/                    # App-level configurations
├── core/                   # Core utilities and shared code
│   ├── di/                # Dependency injection
│   ├── network/           # Network configurations
│   ├── routes/            # App routing
│   └── utils/             # Utility classes and constants
├── features/              # Feature modules
│   ├── reels/            # Reels feature
│   │   ├── data/         # Data layer (repositories, data sources)
│   │   ├── domain/       # Domain layer (entities, use cases)
│   │   └── presentation/ # Presentation layer (pages, widgets, BLoC)
│   └── splash/           # Splash screen feature
└── main.dart             # App entry point

## Key Dependencies

- flutter_bloc : State management
- get_it & injectable : Dependency injection
- hive & hive_flutter : Local caching
- video_player : Video playback
- http : Network requests
- flutter_screenutil : Responsive design

### Performance Tips

- The app implements video preloading for smooth scrolling
- Cached videos will load faster on subsequent views
- Memory usage is optimized through proper disposal of video controllers