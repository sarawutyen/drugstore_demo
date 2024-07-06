# Drugstore Demo

This project is a demo for a drugstore application.

## Getting Started

Follow these steps to get the project up and running.

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK (comes with Flutter)
- Git: [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

### Installation

1. **Clone the project from GitHub:**

   ```sh
   git clone https://github.com/sarawutyen/drugstore_demo.git
   cd drugstore_demo
2. **Set API_KEY for Map and API Service:**

- Android: Update AndroidManifest.xml:

    <meta-data
        android:name="com.google.android.geo.API_KEY"
        android:value="Input API_KEY"/>

- iOS: Update AppDelegate.swift:
    
    GMSServices.provideAPIKey("Input API_KEY")

3. **Run commands:**

    flutter clean
    flutter pub get

4. **Connect your device or Simulator.**

5. **Run command to build the app:**

    flutter run

### Additional Information
For more details on Flutter and its ecosystem, visit the official Flutter documentation.



