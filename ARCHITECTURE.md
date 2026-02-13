# Architecture Overview

## System Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                         HOMEBREW TAP                             │
│                  homebrew-devscope Repository                    │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌────────────────────────────────────────────────────────┐    │
│  │              Formula/devscope.rb                        │    │
│  │  • Python 3.11 dependency                              │    │
│  │  • PyPI tarball source                                 │    │
│  │  • SHA256 verification                                 │    │
│  │  • 14 runtime dependencies                             │    │
│  │  • Virtualenv installation                             │    │
│  └────────────────────────────────────────────────────────┘    │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

## Auto-Update Flow

```
┌──────────────┐
│   PyPI       │
│   New        │
│   Release    │
└──────┬───────┘
       │
       ▼
┌─────────────────────────────────────────────────────────────────┐
│              GitHub Actions (Hourly Cron)                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  1. Fetch PyPI JSON API                                         │
│     └─ GET https://pypi.org/pypi/devscope/json                  │
│                                                                  │
│  2. Extract Latest Version                                      │
│     ├─ version                                                  │
│     ├─ sdist URL                                                │
│     └─ sha256                                                   │
│                                                                  │
│  3. Compare with Current Formula                                │
│     └─ Parse Formula/devscope.rb                                │
│                                                                  │
│  4. Update if Needed                                            │
│     ├─ Update URL                                               │
│     ├─ Update SHA256                                            │
│     └─ sed inline replacement                                   │
│                                                                  │
│  5. Commit & Push                                               │
│     └─ git commit -m "Update devscope to X.Y.Z"                 │
│                                                                  │
└───────────────────────────┬─────────────────────────────────────┘
                            │
                            ▼
                 ┌─────────────────────┐
                 │  Updated Formula     │
                 │  on GitHub           │
                 └──────────┬───────────┘
                            │
                            ▼
                 ┌─────────────────────┐
                 │  Users run:          │
                 │  brew update         │
                 │  brew upgrade        │
                 └──────────────────────┘
```

## User Installation Flow

```
┌──────────────────────────────────────────────────────────────────┐
│                         User's Mac                                │
├──────────────────────────────────────────────────────────────────┤
│                                                                   │
│  1. brew tap EhsanAzish80/devscope                               │
│     └─ Clones github.com/EhsanAzish80/homebrew-devscope          │
│                                                                   │
│  2. brew install devscope                                        │
│     ├─ Downloads PyPI tarball                                    │
│     ├─ Verifies SHA256                                           │
│     ├─ Creates isolated virtualenv                              │
│     ├─ Installs devscope + dependencies                          │
│     └─ Links CLI to /usr/local/bin/devscope                      │
│                                                                   │
│  3. devscope --version                                           │
│     └─ Runs from virtualenv                                      │
│                                                                   │
└──────────────────────────────────────────────────────────────────┘
```

## CI Testing Flow

```
┌──────────────────────────────────────────────────────────────────┐
│                   Pull Request / Push                             │
└───────────────────────────┬──────────────────────────────────────┘
                            │
                            ▼
┌──────────────────────────────────────────────────────────────────┐
│              GitHub Actions (test-formula.yml)                    │
├──────────────────────────────────────────────────────────────────┤
│                                                                   │
│  ┌─────────────────────────────────────────────────────┐        │
│  │  1. Audit Formula                                   │        │
│  │     brew audit --strict --online                    │        │
│  └─────────────────────────────────────────────────────┘        │
│                                                                   │
│  ┌─────────────────────────────────────────────────────┐        │
│  │  2. Install from Source                             │        │
│  │     brew install --build-from-source                │        │
│  └─────────────────────────────────────────────────────┘        │
│                                                                   │
│  ┌─────────────────────────────────────────────────────┐        │
│  │  3. Run Tests                                       │        │
│  │     brew test devscope                              │        │
│  └─────────────────────────────────────────────────────┘        │
│                                                                   │
│  ┌─────────────────────────────────────────────────────┐        │
│  │  4. Verify CLI                                      │        │
│  │     devscope --version                              │        │
│  │     devscope --help                                 │        │
│  └─────────────────────────────────────────────────────┘        │
│                                                                   │
└────────────────────────────┬─────────────────────────────────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │  ✅ Tests Pass   │
                    │  ❌ Tests Fail   │
                    └─────────────────┘
```

## Component Responsibilities

### Formula/devscope.rb
- Defines package metadata
- Specifies Python version dependency
- Lists all runtime dependencies
- Configures virtualenv installation
- Includes test validation

### .github/workflows/update-formula.yml
- Monitors PyPI for new releases (hourly)
- Fetches latest version metadata
- Updates formula automatically
- Commits and pushes changes
- Maintains sync with PyPI

### .github/workflows/test-formula.yml
- Validates formula on every change
- Tests installation process
- Verifies CLI functionality
- Ensures Homebrew compliance
- Runs on macOS environment

### validate.sh
- Local development testing
- Pre-deployment validation
- Formula audit
- Installation verification
- CLI functionality check

## Data Flow

```
PyPI Release → GitHub Actions → Formula Update → Git Push → User Update
     │                                                           │
     │                                                           │
     └─── Direct Download ──────────────────────────────────────┘
                (during brew install)
```

## Security

1. **SHA256 Verification**: Every tarball is verified against PyPI's SHA256
2. **Isolated Virtualenv**: Dependencies don't conflict with system packages
3. **PyPI Source**: Official Python Package Index as source
4. **Homebrew Audit**: Formula validated against Homebrew standards

## Scalability

- ✅ Automatic updates (no manual intervention)
- ✅ Hourly sync checks
- ✅ CI testing on every change
- ✅ Version tracking in CHANGELOG
- ✅ User notifications via `brew upgrade`

## Maintenance Load

- **Zero** - Fully automated after deployment
- Updates happen automatically when you publish to PyPI
- CI catches issues before they reach users
- Documentation guides contributors

---

This architecture ensures that devscope is always available via Homebrew with minimal maintenance overhead.
