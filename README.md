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
# Install from local formula
brew install --build-from-source ./Formula/devscope.rb

# Verify installation
devscope --version

# Audit the formula (after tap is published)
brew tap EhsanAzish80/devscope
brew audit --strict devscope
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
