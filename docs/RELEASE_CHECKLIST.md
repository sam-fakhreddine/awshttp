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
- [ ] Install uv: https://docs.astral.sh/uv/
- [ ] Build package: `make build` or `uv build`
- [ ] (Optional) Test on TestPyPI: `make upload-test`
- [ ] Upload to PyPI: `make upload`
- [ ] Verify package: https://pypi.org/project/awshttp/
- [ ] Test installation: `uv pip install awshttp`

## Post-Release

- [ ] Create GitHub release with tag `v0.1.0`
- [ ] Announce on social media (optional)
- [ ] Update documentation (if needed)

## Quick Commands

```bash
# 1. Sync dependencies
uv sync --all-extras

# 2. Test locally
uv run pytest tests/ -v

# 3. Build
make build

# 4. Upload to PyPI
make upload

# 5. Push to GitHub
git add .
git commit -m "Release v0.1.0"
git push origin master
```
