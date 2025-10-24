# awshttp v0.1.1 - Initial Release

Minimal Python library for making AWS SigV4 signed HTTP requests.

## Features

- 🔐 Automatic AWS credential detection (IAM roles, environment variables, ~/.aws/credentials)
- 🌐 Support for all AWS services including undocumented Console APIs
- 🔄 Built-in retry logic with exponential backoff
- 📦 Simple requests-like interface
- 🎯 JSON helpers for API calls
- ⚙️ Environment variable configuration
- 🪶 Minimal dependencies (boto3, requests)

## Installation

```sh
pip install awshttp
```

## Quick Start

```python
import awshttp

# GET request
response = awshttp.get(
    uri='https://my-api.execute-api.us-east-1.amazonaws.com/prod/endpoint',
    service='execute-api'
)

# POST with JSON
response = awshttp.post_json(
    uri='https://api.example.com/endpoint',
    service='execute-api',
    data={'key': 'value'}
)
```

## Use Cases

Perfect for:
- Lambda functions calling AWS APIs
- Automating AWS Console actions (capture browser API calls and replay them)
- Scripts requiring AWS authentication
- Calling undocumented AWS services

## Documentation

Full documentation: https://github.com/YOUR_USERNAME/awshttp#readme
