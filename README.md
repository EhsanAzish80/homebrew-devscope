# Homebrew Tap for devscope

Official Homebrew tap for [devscope](https://github.com/EhsanAzish80/devscope) - an AI-powered development profiler and intelligence tool.

## Installation

```bash
brew tap EhsanAzish80/devscope
brew install devscope
```

## Usage

After installation, use devscope directly:

```bash
devscope --version
devscope --help
```

## Updating

To update to the latest version:

```bash
brew update
brew upgrade devscope
```

## Uninstallation

```bash
brew uninstall devscope
brew untap EhsanAzish80/devscope
```

## Formula Details

- **Source**: PyPI tarball (synchronized automatically)
- **Python Version**: 3.11
- **Installation**: Isolated virtualenv with all dependencies

## Auto-Updates

This tap automatically syncs with PyPI releases. When a new version of devscope is published to PyPI, the formula is updated within minutes via GitHub Actions.

## Development

### Testing the Formula Locally

```bash
# Create a local tap for testing
REPO_PATH="$(pwd)"
TAP_PATH="$(brew --repository)/Library/Taps/ehsanazish80/homebrew-devscope"
mkdir -p "$(dirname "$TAP_PATH")"
ln -s "$REPO_PATH" "$TAP_PATH"

# Install from local tap
brew install --build-from-source ehsanazish80/devscope/devscope

# Verify installation
devscope --version

# Run tests
brew test ehsanazish80/devscope/devscope

# Audit the formula
brew audit --strict ehsanazish80/devscope/devscope

# Cleanup
brew uninstall devscope
brew untap ehsanazish80/devscope
```

Or use the validation script:
```bash
./validate.sh
```

### Formula Structure

- `Formula/devscope.rb` - Main formula file
- `.github/workflows/update-formula.yml` - Auto-update workflow

## Issues

For issues with the tap or formula, please open an issue at:  
https://github.com/EhsanAzish80/homebrew-devscope/issues

For issues with devscope itself, visit:  
https://github.com/EhsanAzish80/devscope/issues

## License

This tap is licensed under MIT. See the devscope repository for the main project license.
