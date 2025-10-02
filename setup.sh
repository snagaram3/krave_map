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
