.PHONY: clean build upload test install dev

clean:
	rm -rf build dist *.egg-info
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name '*.pyc' -delete

install:
	pip install -e .

dev:
	pip install -e ".[dev]"

test:
	pytest tests/ -v

build: clean
	python -m build

upload-test: build
	python -m twine upload --repository testpypi dist/*

upload: build
	python -m twine upload dist/*
