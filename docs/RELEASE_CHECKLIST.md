# Release Checklist

## Pre-Release

- [ ] All tests pass
- [ ] Version updated in:
  - [ ] `awshttp/awshttp.py` (`__version__`)
  - [ ] `pyproject.toml` (`version`)
- [ ] CHANGELOG.md updated with release date
- [ ] README.md is accurate and complete
- [ ] All files committed to git

## GitHub Setup

- [ ] Create GitHub repository: https://github.com/new
- [ ] Push code to GitHub (see GITHUB_SETUP.md)
- [ ] Add repository topics
- [ ] Update repository description

## PyPI Publishing

- [ ] PyPI account created: https://pypi.org/account/register/
- [ ] Install build tools: `pip install build twine`
- [ ] Build package: `make build`
- [ ] (Optional) Test on TestPyPI: `make upload-test`
- [ ] Upload to PyPI: `make upload`
- [ ] Verify package: https://pypi.org/project/awshttp/
- [ ] Test installation: `pip install awshttp`

## Post-Release

- [ ] Create GitHub release with tag `v0.1.0`
- [ ] Announce on social media (optional)
- [ ] Update documentation (if needed)

## Quick Commands

```bash
# 1. Build
make clean build

# 2. Test locally
pip install -e .
python test_color_change.py

# 3. Upload to PyPI
make upload

# 4. Push to GitHub
git add .
git commit -m "Release v0.1.0"
git push origin main
```
