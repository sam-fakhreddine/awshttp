# Publishing to PyPI

## Prerequisites

1. **Create PyPI account**: https://pypi.org/account/register/
2. **Create TestPyPI account**: https://test.pypi.org/account/register/
3. **Install uv**: https://docs.astral.sh/uv/getting-started/installation/

## Publishing Steps

### 1. Test Locally
```bash
# Install in development mode
uv sync --all-extras

# Run tests
uv run pytest tests/ -v
```

### 2. Update Version
Update version in:
- `awshttp/awshttp.py` (`__version__`)
- `pyproject.toml` (`version`)
- `CHANGELOG.md`

### 3. Build Package
```bash
make build
# Or: uv build
```

This creates:
- `dist/awshttp-0.1.0.tar.gz` (source distribution)
- `dist/awshttp-0.1.0-py3-none-any.whl` (wheel)

### 4. Test on TestPyPI (Optional but Recommended)
```bash
# Upload to TestPyPI
uv run twine upload --repository testpypi dist/*

# Test installation
uv pip install --index-url https://test.pypi.org/simple/ awshttp
```

### 5. Publish to PyPI
```bash
# Upload to PyPI
make upload
# Or manually:
uv run twine upload dist/*
```

### 6. Create GitHub Release
1. Push code to GitHub
2. Create a new release with tag `v0.1.0`
3. Add release notes from CHANGELOG.md

## Quick Commands

```bash
# Clean build artifacts
make clean

# Build package
make build

# Upload to TestPyPI
make upload-test

# Upload to PyPI
make upload
```

## Troubleshooting

**Authentication Error**: Create `~/.pypirc`:
```ini
[pypi]
username = __token__
password = pypi-YOUR-TOKEN-HERE

[testpypi]
username = __token__
password = pypi-YOUR-TESTPYPI-TOKEN-HERE
```

**Package Already Exists**: Increment version number and rebuild.

## Automated Publishing with GitHub Actions

The repository includes `.github/workflows/publish.yml` for automatic PyPI publishing.

### Setup

1. **Create PyPI API Token**:
   - Go to https://pypi.org/manage/account/token/
   - Create a new API token
   - Scope: "Entire account" or specific to "awshttp" project
   - Copy the token (starts with `pypi-`)

2. **Add Token to GitHub Secrets**:
   ```bash
   gh secret set PYPI_API_TOKEN
   # Paste your PyPI token when prompted
   ```
   
   Or manually:
   - Go to repository Settings → Secrets and variables → Actions
   - Click "New repository secret"
   - Name: `PYPI_API_TOKEN`
   - Value: Your PyPI token

3. **Publish by Creating a Release**:
   ```bash
   # Update version in code first, then:
   git add .
   git commit -m "Bump version to 0.2.0"
   git push
   
   # Create release (triggers automatic PyPI publish)
   gh release create v0.2.0 --title "v0.2.0" --notes "Release notes here"
   ```

The workflow automatically builds and publishes to PyPI when you create a GitHub release!
