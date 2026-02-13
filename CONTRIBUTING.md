# Contributing to homebrew-devscope

Thank you for your interest in contributing to the devscope Homebrew tap!

## Development Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/EhsanAzish80/homebrew-devscope.git
   cd homebrew-devscope
   ```

2. Install Homebrew (if not already installed):
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

## Testing Changes

### Local Installation

Test your formula changes locally:

```bash
brew install --build-from-source ./Formula/devscope.rb
```

### Running Tests

```bash
brew test devscope
```

### Audit Formula

Ensure the formula meets Homebrew standards:

```bash
# After the tap is published, audit with:
brew tap EhsanAzish80/devscope
brew audit --strict --online devscope

# For local file testing (may show warnings):
brew audit --strict Formula/devscope.rb
```

**Note**: `brew audit` with file paths is deprecated in newer Homebrew versions. Full auditing requires the formula to be in a tap.

### Style Checks

```bash
brew style Formula/devscope.rb
```

## Updating the Formula

### Manual Update

When a new version of devscope is released:

1. Get the new version info from PyPI:
   ```bash
   curl -s https://pypi.org/pypi/devscope/json | python3 -c "import sys, json; data = json.load(sys.stdin); sdist = [u for u in data['urls'] if u['packagetype'] == 'sdist'][0]; print(f\"Version: {data['info']['version']}\"); print(f\"URL: {sdist['url']}\"); print(f\"SHA256: {sdist['digests']['sha256']}\")"
   ```

2. Update `Formula/devscop || true
   brew install --build-from-source ./Formula/devscope.rb
   
   # Verify the version
   devscope --version56` hash
   - Update resource versions if dependencies changed

3. Test the update:
   ```bash
   brew uninstall devscope
   brew install --build-from-source ./Formula/devscope.rb
   brew test devscope
   ```

4. Commit and push:
   ```bash
   git add Formula/devscope.rb
   git commit -m "Update devscope to X.Y.Z"
   git push
   ```

### Automatic Updates

The repository includes a GitHub Action (`.github/workflows/update-formula.yml`) that automatically checks for new PyPI releases hourly and updates the formula.

## Formula Guidelines

- Always use the PyPI source tarball, not GitHub archives
- Keep the formula simple and maintainable
- Use `virtualenv_install_with_resources` for Python packages
- Pin to `python@3.11` for stability
- Include all runtime dependencies as resources
- Test block must verify the CLI works

## Dependency Updates

When updating dependencies:

1. Install the package locally:
   ```bash
   pip download --no-binary :all: --no-deps <package>
   ```

2. Calculate SHA256:
   ```bash
   shasum -a 256 <package>.tar.gz
   ```

3. Update the resource block in the formula

## Pull Request Process

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly using the commands above
5. Submit a pull request with:
   - Clear description of changes
   - Test results
   - Why the change is needed

## Reporting Issues

- **Formula issues**: Open an issue in this repository
- **devscope bugs**: Report at https://github.com/EhsanAzish80/devscope/issues

## Code of Conduct

Be respectful and constructive. We're all here to make devscope more accessible via Homebrew.

## Questions?

Open a discussion or issue - we're happy to help!
