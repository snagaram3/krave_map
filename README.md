# Business Discovery Platform 🌟

An AI-powered Flutter application that discovers local businesses, scrapes and analyzes reviews, and generates bold taglines using artificial intelligence.

## ✨ Features

- **Interactive Category Maps**: Beautiful, colorful maps for different business categories
- **Sparkling Business Markers**: Animated markers with glowing effects
- **AI-Generated Taglines**: Automatic tagline generation from review analysis
- **Press & Hold Interaction**: Long-press to view detailed business profiles
- **Cross-Platform**: Works on iOS, Android, and Web

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio / Xcode (for mobile development)
- A backend API for review scraping and AI processing

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/business_discovery.git
cd business_discovery

2. Install dependencies:
```bash
flutter pub get

3. Configure your API endpoints in lib/services/:

	- Update baseUrl in review_scraper_service.dart
	- Update baseUrl in ai_tagline_generator.dart


4. Run the app:
```bash
flutter run

🏗️ Project Structure

lib/
├── main.dart                    # App entry point
├── models/                      # Data models
│   ├── business.dart
│   └── review.dart
├── screens/                     # UI screens
│   ├── category_map_screen.dart
│   └── business_detail_sheet.dart
├── services/                    # Backend services
│   ├── review_scraper_service.dart
│   └── ai_tagline_generator.dart
└── widgets/                     # Reusable widgets
    ├── business_marker.dart
    └── category_selector.dart

🔧 Backend Setup
You'll need to create a backend API that handles:

Review Scraping: Collect reviews from Google, Yelp, TripAdvisor, etc.
AI Processing: Use OpenAI, Anthropic Claude, or similar to generate taglines
Data Storage: Store businesses, reviews, and generated taglines

Example backend endpoints needed:

GET /api/scrape-reviews/:businessId
POST /api/generate-tagline
POST /api/trigger-scraping
POST /api/analyze-sentiment

📱 Usage

Select a Category: Tap on category chips at the top (Food, Bar, etc.)
Explore the Map: View sparkling business markers on the interactive map
View Details: Press and hold any business marker to see full details
AI Taglines: Each business displays an AI-generated tagline based on reviews

🎨 Customization
Colors
```dart
final Map<String, Color> categoryColors = {
  'Food': Colors.orange,
  'Bar': Colors.purple,
  // Add more...
};

Categories
Modify the categories list to add/remove categories:
```dart
final List<String> categories = ['Food', 'Bar', 'Night Clubs', 'Cafe'];

;
🤝 Contributing
Contributions are welcome! Please feel free to submit a Pull Request.
📄 License
This project is licensed under the MIT License - see the LICENSE file for details.
🙏 Acknowledgments

Flutter team for the amazing framework
OpenAI/Anthropic for AI capabilities
Community contributors

📧 Contact
Your Name - your.email@example.com
Project Link: https://github.com/yourusername/business_discovery

### **.gitignore**
```gitignore
# Miscellaneous
*.class
*.log
*.pyc
*.swp
.DS_Store
.atom/
.buildlog/
.history
.svn/
migrate_working_dir/

# IntelliJ related
*.iml
*.ipr
*.iws
.idea/

# VSCode related
.vscode/

# Flutter/Dart/Pub related
**/doc/api/
**/ios/Flutter/.last_build_id
.dart_tool/
.flutter-plugins
.flutter-plugins-dependencies
.packages
.pub-cache/
.pub/
/build/

# Web related
lib/generated_plugin_registrant.dart

# Symbolication related
app.*.symbols

# Obfuscation related
app.*.map.json

# Android Studio will place build artifacts here
/android/app/debug
/android/app/profile
/android/app/release

# iOS/XCode related
**/ios/**/*.mode1v3
**/ios/**/*.mode2v3
**/ios/**/*.moved-aside
**/ios/**/*.pbxuser
**/ios/**/*.perspectivev3
**/ios/**/*sync/
**/ios/**/.sconsign.dblite
**/ios/**/.tags*
**/ios/**/.vagrant/
**/ios/**/DerivedData/
**/ios/**/Icon?
**/ios/**/Pods/
**/ios/**/.symlinks/
**/ios/**/profile
**/ios/**/xcuserdata
**/ios/.generated/
**/ios/Flutter/App.framework
**/ios/Flutter/Flutter.framework
**/ios/Flutter/Flutter.podspec
**/ios/Flutter/Generated.xcconfig
**/ios/Flutter/ephemeral/
**/ios/Flutter/app.flx
**/ios/Flutter/app.zip
**/ios/Flutter/flutter_assets/
**/ios/Flutter/flutter_export_environment.sh
**/ios/ServiceDefinitions.json
**/ios/Runner/GeneratedPluginRegistrant.*

# Exceptions to above rules.
!**/ios/**/default.mode1v3
!**/ios/**/default.mode2v3
!**/ios/**/default.pbxuser
!**/ios/**/default.perspectivev3


🚀 Quick Start Commands
setup.sh (Create this file in root)

```bash 
#!/bin/bash

echo "🚀 Setting up Business Discovery Platform..."

# Check Flutter installation
if ! command -v flutter &> /dev/null
then
    echo "❌ Flutter not found. Please install Flutter first."
    exit 1
fi

echo "✅ Flutter found"

# Install Flutter dependencies
echo "📦 Installing Flutter dependencies..."
flutter pub get

# Check for Android/iOS setup
echo "🔍 Checking platform setup..."
flutter doctor

# Create necessary directories
mkdir -p assets/images
mkdir -p test

echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. Configure your API endpoints in lib/services/"
echo "2. Set up your backend (see backend/ directory)"
echo "3. Run 'flutter run' to start the app"

📊 Sample API Response Formats
Review Object

```json

{
  "id": "rev_123456",
  "businessId": "biz_789",
  "author": "John Doe",
  "text": "Amazing food and great service! The atmosphere was perfect for a date night.",
  "rating": 5.0,
  "date": "2024-10-01T19:30:00Z",
  "source": "google"
}

Tagline Generation Response

```json
{
  "tagline": "Where culinary dreams come true",
  "confidence": 0.92,
  "sentiment_score": 4.7,
  "review_count": 347
}

Sentiment Analysis Response
```json
{
  "overall_sentiment": "positive",
  "scores": {
    "positive": 78,
    "neutral": 15,
    "negative": 7
  },
  "key_themes": [
    "excellent service",
    "great atmosphere",
    "delicious food",
    "friendly staff"
  ],
  "top_keywords": ["amazing", "perfect", "love", "recommend"]
}

🎯 Deployment Guide
Deploy to Firebase (Web)

```bash

# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Initialize Firebase
firebase init hosting

# Build Flutter web app
flutter build web

# Deploy
firebase deploy

Deploy to Google Play Store (Android)
```bash
# Build release APK
flutter build apk --release

# Or build App Bundle
flutter build appbundle --release

# APK will be at: build/app/outputs/flutter-apk/app-release.apk

Deploy to App Store (iOS)
```bash
# Build iOS release
flutter build ios --release

# Open in Xcode for signing and upload
open ios/Runner.xcworkspace

🧪 Testing
test/widget_test.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:business_discovery/main.dart';

void main() {
  testWidgets('App loads with category selector', (WidgetTester tester) async {
    await tester.pumpWidget(const BusinessDiscoveryApp());

    expect(find.text('Food'), findsOneWidget);
    expect(find.text('Bar'), findsOneWidget);
    expect(find.text('Night Clubs'), findsOneWidget);
  });

  testWidgets('Category changes when tapped', (WidgetTester tester) async {
    await tester.pumpWidget(const BusinessDiscoveryApp());

    await tester.tap(find.text('Bar'));
    await tester.pumpAndSettle();

    // Verify category changed
    expect(find.text('Bar'), findsOneWidget);
  });
}

RUN tests:
```bash
flutter test


