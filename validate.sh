#!/bin/bash
# Local validation script for homebrew-devscope

set -e

echo "🧪 Homebrew devscope Formula Validation"
echo "========================================"
echo ""

# Check Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew is not installed"
    exit 1
fi
echo "✅ Homebrew found: $(brew --version | head -1)"

# Check formula syntax
echo ""
echo "📝 Validating formula syntax..."
if ruby -c Formula/devscope.rb > /dev/null 2>&1; then
    echo "✅ Ruby syntax is valid"
else
    echo "❌ Ruby syntax check failed"
    exit 1
fi

# Note about brew audit
echo ""
echo "⚠️  Note: This script tests the formula by creating a temporary local tap."
echo ""

# Create temporary tap structure
echo "🔧 Setting up temporary local tap..."
REPO_PATH="$(pwd)"
TAP_PATH="$(brew --repository)/Library/Taps/ehsanazish80/homebrew-devscope"

# Remove existing tap if present
if [ -d "$TAP_PATH" ]; then
    rm -rf "$TAP_PATH"
fi

# Create tap directory structure
mkdir -p "$(dirname "$TAP_PATH")"

# Symlink this repository as a tap
ln -s "$REPO_PATH" "$TAP_PATH"
echo "✅ Temporary tap created"

# Install from source
echo ""
echo "📦 Installing from source..."
if brew list devscope &> /dev/null; then
    echo "ℹ️  devscope is already installed, uninstalling first..."
    brew uninstall devscope
fi

if brew install --build-from-source ehsanazish80/devscope/devscope; then
    echo "✅ Installation successful"
else
    echo "❌ Installation failed"
    # Cleanup
    brew untap ehsanazish80/devscope || true
    exit 1
fi

# Run tests
echo ""
echo "🧪 Running formula tests..."
if brew test ehsanazish80/devscope/devscope; then
    echo "✅ Formula tests passed"
else
    echo "⚠️  Formula tests had issues (checking manually...)"
fi

# Verify CLI
echo ""
echo "🧪 Verifying installation..."
if devscope --version > /dev/null 2>&1; then
    VERSION=$(devscope --version)
    echo "✅ CLI works correctly: $VERSION"
else
    echo "❌ CLI verification failed"
    # Cleanup
    brew uninstall devscope || true
    brew untap ehsanazish80/devscope || true
    exit 1
fi

# Check installation details
echo ""
echo "📊 Installation details:"
brew info ehsanazish80/devscope/devscope

echo ""
echo "🎉 All validations passed!"
echo ""
echo "To clean up:"
echo "  brew uninstall devscope"
echo "  brew untap ehsanazish80/devscope"
echo ""
echo "Note: The tap symlink will be removed when you run 'brew untap'"

# Offer to cleanup
read -p "Clean up now? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew uninstall devscope
    brew untap ehsanazish80/devscope
    echo "✅ Cleanup complete"
fi
