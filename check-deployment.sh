#!/bin/bash
# Pre-deployment verification checklist
# Run this before pushing to GitHub

set -e

echo "╔════════════════════════════════════════════════════════════════╗"
echo "║     homebrew-devscope Pre-Deployment Check                     ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

PASS=0
FAIL=0

check() {
    local message="$1"
    shift
    if "$@" 2>/dev/null; then
        echo "✅ $message"
        ((PASS++))
        return 0
    else
        echo "❌ $message"
        ((FAIL++))
        return 1
    fi
}

# Check required files exist
echo "📁 Checking required files..."
check "Formula exists" test -f "Formula/devscope.rb"
check "README exists" test -f "README.md"
check "Update workflow exists" test -f ".github/workflows/update-formula.yml"
check "Test workflow exists" test -f ".github/workflows/test-formula.yml"
check "License exists" test -f "LICENSE"
check "Gitignore exists" test -f ".gitignore"

echo ""
echo "🔍 Checking formula syntax..."

# Check formula has required fields
check "Class defined" grep -q "class Devscope < Formula" "Formula/devscope.rb"
check "Description present" grep -q "desc" "Formula/devscope.rb"
check "Homepage present" grep -q "homepage" "Formula/devscope.rb"
check "PyPI URL present" grep -q "url.*pythonhosted.org.*devscope.*tar.gz" "Formula/devscope.rb"
check "SHA256 hash present" grep -q "sha256" "Formula/devscope.rb"
check "Python dependency" grep -q "depends_on.*python@3.11" "Formula/devscope.rb"
check "Virtualenv install method" grep -q "virtualenv_install_with_resources" "Formula/devscope.rb"
check "Test block present" grep -q "test do" "Formula/devscope.rb"

echo ""
echo "📝 Checking documentation..."

check "Installation command in README" grep -q "brew tap EhsanAzish80/devscope" "README.md"
check "Install command in README" grep -q "brew install devscope" "README.md"

echo ""
echo "⚙️  Checking workflows..."

check "Update workflow has triggers" grep -q "on:" ".github/workflows/update-formula.yml"
check "Cron schedule configured" grep -q "schedule:" ".github/workflows/update-formula.yml"
check "PyPI API call present" grep -q "pypi.org.*devscope.*json" ".github/workflows/update-formula.yml"
check "Formula audit in test workflow" grep -q "brew audit" ".github/workflows/test-formula.yml"
check "Build test present" grep -q "brew install.*build-from-source" ".github/workflows/test-formula.yml"
check "Test command present" grep -q "brew test devscope" ".github/workflows/test-formula.yml"

echo ""
echo "🔐 Checking permissions..."
check "validate.sh is executable" test -x "validate.sh"

echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "Results: ✅ $PASS passed  ❌ $FAIL failed"
echo "═══════════════════════════════════════════════════════════════"

if [ $FAIL -eq 0 ]; then
    echo ""
    echo "🎉 All checks passed! Repository is ready for deployment."
    echo ""
    echo "Next steps:"
    echo "  1. git init (if not done)"
    echo "  2. git add ."
    echo "  3. git commit -m \"Initial commit: Production-ready Homebrew tap\""
    echo "  4. git remote add origin https://github.com/EhsanAzish80/homebrew-devscope.git"
    echo "  5. git push -u origin main"
    echo ""
    echo "After pushing:"
    echo "  - Enable GitHub Actions write permissions"
    echo "  - Test: brew tap EhsanAzish80/devscope"
    echo "  - Test: brew install devscope"
    echo ""
    exit 0
else
    echo ""
    echo "⚠️  Some checks failed. Please review before deployment."
    echo ""
    exit 1
fi
