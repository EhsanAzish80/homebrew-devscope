# Deployment Guide

This guide walks you through deploying the homebrew-devscope tap to GitHub and making it production-ready.

## Prerequisites

- GitHub account
- Git installed locally
- Homebrew installed (for testing)
- Repository access to create `homebrew-devscope`

## Step 1: Create GitHub Repository

1. Go to https://github.com/new
2. Create a repository named: `homebrew-devscope`
3. Make it **public** (required for Homebrew taps)
4. **Do not** initialize with README (we already have files)

## Step 2: Push to GitHub

From your local repository:

```bash
cd /Users/ehsanazish/Documents/Projects/homebrew-devscope

# Initialize git (if not already done)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit: Production-ready Homebrew tap for devscope"

# Add remote (replace with your actual repository URL)
git remote add origin https://github.com/EhsanAzish80/homebrew-devscope.git

# Push to main branch
git branch -M main
git push -u origin main
```

## Step 3: Configure GitHub Actions

The repository includes two workflows that will run automatically:

### update-formula.yml
- Checks PyPI hourly for new devscope releases
- Automatically updates the formula
- Commits and pushes changes

**Required**: Ensure GitHub Actions has write permissions:
1. Go to repository Settings → Actions → General
2. Under "Workflow permissions", select:
   - ✅ "Read and write permissions"
3. Save

### test-formula.yml
- Runs on every push and PR
- Tests the formula on macOS
- Validates installation

## Step 4: Test the Tap Locally

Before announcing, test the tap works:

```bash
# Add your tap
brew tap EhsanAzish80/devscope

# Install devscope
brew install devscope

# Test it works
devscope --version

# Clean up
brew uninstall devscope
brew untap EhsanAzish80/devscope
```

## Step 5: Validate Formula

Run the validation script:

```bash
./validate.sh
```

This will:
- Audit the formula
- Install from source
- Run tests
- Verify CLI functionality

## Step 6: Manual First Run of Auto-Update

Trigger the auto-update workflow manually to ensure it works:

1. Go to: `https://github.com/EhsanAzish80/homebrew-devscope/actions`
2. Click "Update devscope Formula"
3. Click "Run workflow" → "Run workflow"
4. Wait for completion and check logs

## Step 7: Update Main devscope Repository

Add installation instructions to your main devscope repository README:

```markdown
## Installation

### Via Homebrew (macOS)

```bash
brew tap EhsanAzish80/devscope
brew install devscope
```

### Via pip

```bash
pip install devscope
```
\`\`\`

## Step 8: Announce

Update your project documentation:

1. Add to devscope README.md
2. Add to release notes
3. Update any installation documentation
4. Consider adding a badge:

```markdown
[![Homebrew](https://img.shields.io/badge/Homebrew-tap-orange)](https://github.com/EhsanAzish80/homebrew-devscope)
```

## Ongoing Maintenance

### Automatic Updates

The tap will automatically update when you publish to PyPI:

1. Release new version to PyPI
2. Within 1 hour, GitHub Actions detects it
3. Formula is updated automatically
4. Users get updates via `brew upgrade devscope`

### Manual Updates

If needed, manually update the formula:

```bash
# Get latest PyPI info
curl -s https://pypi.org/pypi/devscope/json | \
  python3 -c "import sys, json; data = json.load(sys.stdin); \
  sdist = [u for u in data['urls'] if u['packagetype'] == 'sdist'][0]; \
  print(f\"Version: {data['info']['version']}\n\" \
        f\"URL: {sdist['url']}\n\" \
        f\"SHA256: {sdist['digests']['sha256']}\")"

# Update Formula/devscope.rb with new URL and SHA256

# Test
./validate.sh

# Commit and push
git add Formula/devscope.rb
git commit -m "Update devscope to X.Y.Z"
git push
```

### Monitoring

- Check GitHub Actions runs regularly
- Monitor issues in the tap repository
- Verify users can install successfully

## Troubleshooting

### Actions Don't Have Write Permission

**Error**: "refusing to allow a GitHub App to create or update workflow"

**Solution**:
1. Settings → Actions → General
2. Workflow permissions → Read and write permissions
3. Save

### Formula Fails Audit

**Error**: Audit errors on formula

**Solution**:
```bash
brew audit --strict --online Formula/devscope.rb
# Fix reported issues
```

### Auto-Update Not Working

**Check**:
1. GitHub Actions logs
2. PyPI API accessibility
3. Formula syntax after automatic updates

## Production Checklist

- [ ] Repository is public
- [ ] GitHub Actions have write permissions
- [ ] Formula passes `brew audit --strict`
- [ ] Formula installs successfully
- [ ] CLI works: `devscope --version`
- [ ] Auto-update workflow runs successfully
- [ ] Test workflow passes on CI
- [ ] README has clear installation instructions
- [ ] Main devscope repository links to tap
- [ ] Tested on clean macOS system

## Support

After deployment:

- Monitor: https://github.com/EhsanAzish80/homebrew-devscope/issues
- Users can report issues via GitHub Issues
- Auto-updates keep formula in sync with PyPI

## Next Steps

After successful deployment:

1. Consider submitting to homebrew-core (optional)
2. Add installation analytics (optional)
3. Create installation troubleshooting guide
4. Document common user issues

---

**Congratulations!** Your Homebrew tap is now production-ready and will stay automatically synced with PyPI releases. 🎉
