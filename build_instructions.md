# Chikuu Build Instructions

1. Add Firebase config files:
   - Place `google-services.json` in `/android/app/`
   - Place `GoogleService-Info.plist` in `/ios/Runner/`
2. Install dependencies:
   ```
   flutter pub get
   ```
3. For Android:
   ```
   flutter build apk
   ```
4. For iOS:
   ```
   flutter build ios
   ```