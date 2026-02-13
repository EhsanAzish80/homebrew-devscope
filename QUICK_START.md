# Quick Start Guide

## For Users

### Installation

```bash
# Add the tap
brew tap EhsanAzish80/devscope

# Install devscope
brew install devscope

# Verify installation
devscope --version
```

### Usage

```bash
# Run devscope
devscope --help
```

### Updating

```bash
# Update tap and upgrade devscope
brew update
brew upgrade devscope
```

## For Maintainers

### Local Testing

Run the validation script:

```bash
./validate.sh
```

Or manually:

```bash
# Audit formula
brew audit --strict Formula/devscope.rb

# Install from source
brew install --build-from-source ./Formula/devscope.rb

# Run tests
brew test devscope

# Verify
devscope --version
```

### Updating Formula

The formula auto-updates via GitHub Actions, but for manual updates:

1. Get latest PyPI info:
```bash
curl -s https://pypi.org/pypi/devscope/json | \
  python3 -c "import sys, json; data = json.load(sys.stdin); \
  sdist = [u for u in data['urls'] if u['packagetype'] == 'sdist'][0]; \
  print(f\"Version: {data['info']['version']}\n\" \
        f\"URL: {sdist['url']}\n\" \
        f\"SHA256: {sdist['digests']['sha256']}\")"
```

2. Update `Formula/devscope.rb` with new URL and SHA256

3. Test and commit:
```bash
./validate.sh
git add Formula/devscope.rb
git commit -m "Update devscope to X.Y.Z"
git push
```

### Repository Structure

```
homebrew-devscope/
├── Formula/
│   └── devscope.rb           # Main formula file
├── .github/
│   └── workflows/
│       ├── update-formula.yml # Auto-update workflow
│       └── test-formula.yml   # CI testing
├── README.md                  # User documentation
├── CONTRIBUTING.md            # Contributor guide
├── LICENSE                    # MIT license
├── QUICK_START.md            # This file
├── validate.sh               # Local validation script
└── .gitignore                # Git ignore rules
```

### GitHub Actions

- **update-formula.yml**: Runs hourly, checks PyPI for new releases
- **test-formula.yml**: Tests formula on every push/PR

### Troubleshooting

**Formula fails to install:**
- Check Python 3.11 is available: `brew info python@3.11`
- Verify PyPI URL is accessible
- Check SHA256 hash matches

**Tests fail:**
- Ensure devscope is properly installed
- Check CLI is in PATH
- Verify virtualenv isolation

**Auto-update not working:**
- Check GitHub Actions logs
- Verify repository permissions
- Ensure GITHUB_TOKEN has write access

## Support

- Tap issues: https://github.com/EhsanAzish80/homebrew-devscope/issues
- devscope issues: https://github.com/EhsanAzish80/devscope/issues
