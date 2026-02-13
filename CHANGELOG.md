# Changelog

All notable changes to the homebrew-devscope tap will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

## [0.1.1] - 2026-02-13

### Added
- Initial production-ready Homebrew tap
- Formula for devscope v0.1.1
- Auto-update workflow (checks PyPI hourly)
- CI testing workflow
- Comprehensive documentation:
  - README.md (user guide)
  - DEPLOYMENT.md (deployment guide)
  - CONTRIBUTING.md (contributor guide)
  - QUICK_START.md (quick reference)
  - SUMMARY.md (repository overview)
- Local validation script (validate.sh)
- MIT License
- .gitignore for Homebrew projects

### Formula Details
- Source: PyPI tarball (devscope-0.1.1.tar.gz)
- SHA256: ad9cd1453bfd96867ea907557224af17c9c440f10294b6e41e8f3e5b9955ace8
- Python: 3.11
- Dependencies: 14 packages (anthropic, anyio, certifi, distro, gitdb, gitpython, h11, httpcore, httpx, idna, jiter, pydantic, pydantic-core, smmap, sniffio, typing-extensions)

## Future Updates

Future updates will be logged here automatically by the update-formula.yml workflow.

---

### Update Format

When the auto-update workflow runs, entries should follow this format:

```markdown
## [X.Y.Z] - YYYY-MM-DD

### Changed
- Updated devscope from X.Y.Z-1 to X.Y.Z
- Updated SHA256: [new hash]
- Source: [PyPI URL]

### Dependencies
- List any dependency changes
```

[Unreleased]: https://github.com/EhsanAzish80/homebrew-devscope/compare/v0.1.1...HEAD
[0.1.1]: https://github.com/EhsanAzish80/homebrew-devscope/releases/tag/v0.1.1
