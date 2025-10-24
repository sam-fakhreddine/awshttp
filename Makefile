.PHONY: clean build upload test install dev sync

clean:
	rm -rf build dist *.egg-info
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name '*.pyc' -delete

sync:
	uv sync --all-extras

install:
	uv pip install -e .

dev: sync

test:
	uv run pytest tests/ -v

build: clean
	uv build

upload-test: build
	uv run twine upload --repository testpypi dist/*

upload: build
	uv run twine upload dist/*
