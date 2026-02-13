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
echo "⚠️  Note: 'brew audit --strict' requires formula to be in a tap."
echo "    Skipping strict audit. After publishing, run:"
echo "    brew tap EhsanAzish80/devscope && brew audit --strict devscope"

# Install from source
echo ""
echo "📦 Installing from source..."
if brew list devscope &> /dev/null; then
    echo "ℹ️  devscope is already installed, uninstalling first..."
    brew uninstall devscope
fi

if brew install --build-from-source ./Formula/devscope.rb; then
    echo "✅ Installation successful"
else
    echo "❌ Installation failed"
    exit 1
fi

# Run tests
echo ""
echo "🧪 Verifying installation..."
if devscope --version > /dev/null 2>&1; then
    VERSION=$(devscope --version)
    echo "✅ CLI works correctly: $VERSION"
else
    echo "❌ CLI verification failed"
    exit 1
fi

# Check installation details
echo ""
echo "📊 Installation details:"
brew info devscope

echo ""
echo "🎉 All validations passed!"
echo ""
echo "To clean up, run: brew uninstall devscope"
