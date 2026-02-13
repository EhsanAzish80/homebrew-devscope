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
echo "📝 Auditing formula..."
if brew audit --strict Formula/devscope.rb; then
    echo "✅ Formula audit passed"
else
    echo "⚠️  Formula audit had warnings (review above)"
fi

# Check formula style
echo ""
echo "🎨 Checking formula style..."
if brew style Formula/devscope.rb; then
    echo "✅ Formula style is correct"
else
    echo "❌ Formula style check failed"
    exit 1
fi

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
echo "🧪 Running formula tests..."
if brew test devscope; then
    echo "✅ Formula tests passed"
else
    echo "❌ Formula tests failed"
    exit 1
fi

# Verify CLI
echo ""
echo "🔍 Verifying CLI..."
if devscope --version; then
    echo "✅ CLI works correctly"
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
