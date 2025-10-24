# Contributing to awshttp

Thanks for your interest in contributing!

## Development Setup

```bash
git clone https://github.com/sam-fakhreddine/awshttp.git
cd awshttp

# Using uv (recommended)
uv sync --all-extras

# Or using traditional venv
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -e ".[dev]"
```

## Running Tests

```bash
# Using uv
uv run pytest tests/ -v

# Or using make
make test
```

## Submitting Changes

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Code Style

- Follow PEP 8
- Use type hints
- Keep it minimal and focused
