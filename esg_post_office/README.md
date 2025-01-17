# ESG Post Office

<p align="center">
  <img src="assets/logo.png" alt="ESG Post Office Logo" width="200"/>
</p>

[![Flutter Version](https://img.shields.io/badge/Flutter-3.4.3-blue.svg)](https://flutter.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

A comprehensive Flutter application for tracking and managing environmental sustainability metrics in post offices. This project aims to help postal services monitor and reduce their carbon footprint through various sustainability initiatives.

## 🌟 Features

- **Bill Management**
  - Electricity consumption tracking
  - Water usage monitoring
  - Fuel consumption analytics
  - Solar panel integration

- **Carbon Credits**
  - Real-time carbon footprint calculation
  - CO₂ savings tracking
  - Environmental impact analytics

- **Dashboard**
  - Comprehensive overview of sustainability metrics
  - Real-time alerts and notifications
  - Performance trends and analytics

## 📋 Prerequisites

Before you begin, make sure you have the following installed on your computer:

1. **Flutter SDK (version 3.4.3 or higher)**
   - Download from [Flutter Official Website](https://flutter.dev/docs/get-started/install)
   - Add Flutter to your system PATH

2. **Dart SDK (version 3.0.0 or higher)**
   - This comes with Flutter SDK

3. **Android Studio OR Visual Studio Code**
   - [Android Studio](https://developer.android.com/studio)
   - [VS Code](https://code.visualstudio.com/) with Flutter extension

4. **Git**
   - [Download Git](https://git-scm.com/downloads)

5. For iOS development (Mac only):
   - Xcode (latest version)
   - CocoaPods (`sudo gem install cocoapods`)

## 🚀 Step-by-Step Setup Guide

1. **Check Flutter Installation**
   ```bash
   flutter doctor
   ```
   - Fix any issues reported by flutter doctor before proceeding

2. **Clone the Repository**
   ```bash
   git clone <your-repository-url>
   cd esg_post_office
   ```

3. **Install Dependencies**
   ```bash
   flutter pub get
   ```

4. **Configure Firebase**
   - Create a new project in [Firebase Console](https://console.firebase.google.com)
   - For Android:
     - Download `google-services.json` from Firebase Console
     - Place it in `android/app/`
   - For iOS:
     - Download `GoogleService-Info.plist`
     - Place it in `ios/Runner/`
     - Run `pod install` in the `ios/` directory

5. **Set up OpenAI API (for AI features)**
   - Create a `.env` file in the project root
   - Add your OpenAI API key:
     ```
     OPENAI_API_KEY=your_api_key_here
     ```

6. **Run the Application**
   
   For Android:
   ```bash
   # Make sure an Android emulator is running or a device is connected
   flutter run
   ```

   For iOS (Mac only):
   ```bash
   # Make sure an iOS simulator is running or a device is connected
   cd ios
   pod install
   cd ..
   flutter run
   ```

## 🔧 Troubleshooting Common Issues

1. **Flutter Doctor Shows Errors**
   - Follow the specific instructions provided by `flutter doctor`
   - Make sure all paths are correctly set in your system environment

2. **Build Fails on Android**
   - Check if Android Studio is properly set up
   - Verify that Android SDK is installed
   - Ensure `google-services.json` is in the correct location

3. **Build Fails on iOS**
   - Run `pod install` in the `ios/` directory
   - Make sure Xcode is up to date
   - Verify that `GoogleService-Info.plist` is properly placed

4. **Dependencies Issues**
   - Try running:
     ```bash
     flutter clean
     flutter pub get
     ```

5. **Firebase Connection Issues**
   - Verify Firebase configuration files are in correct locations
   - Check if the package name/bundle ID matches Firebase settings

## 📱 Running on Physical Devices

### Android Device:
1. Enable Developer Options on your device
2. Enable USB Debugging
3. Connect your device via USB
4. Run `flutter devices` to verify connection
5. Execute `flutter run`

### iOS Device (Mac only):
1. Open the project in Xcode
2. Sign the app with your Apple Developer account
3. Select your device in Xcode
4. Run the app through Xcode or use `flutter run`

## 📝 Additional Notes
- Keep your API keys secure and never commit them to version control
- Regular `flutter pub get` updates are recommended
- Check the official [Flutter documentation](https://flutter.dev/docs) for more detailed information

## 🤝 Need Help?
- Check the [Flutter documentation](https://flutter.dev/docs)
- Visit the [Flutter GitHub repository](https://github.com/flutter/flutter)
- Join the [Flutter Discord community](https://discord.gg/flutter)