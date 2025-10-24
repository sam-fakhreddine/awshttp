# awshttp

Minimal Python library for making AWS SigV4 signed HTTP requests.

Perfect for Lambda functions and scripts that need to call AWS APIs with automatic credential detection.

**Automate AWS Console actions programmatically!** Capture API calls from your browser's Network tab and replay them in Python.

## Installation

```sh
# Using pip
pip install awshttp

# Using uv (recommended)
uv pip install awshttp
```

## Usage

```python
import awshttp

# GET request
response = awshttp.get(
    uri='https://my-api.execute-api.us-east-1.amazonaws.com/prod/endpoint',
    service='execute-api'
)
print(response.json())

# POST request
response = awshttp.post(
    uri='https://my-api.execute-api.us-east-1.amazonaws.com/prod/endpoint',
    service='execute-api',
    data='{"key": "value"}',
    headers={'content-type': 'application/json'}
)

# PUT request with JSON helper
response = awshttp.put_json(
    uri='https://uxc.us-east-1.api.aws/v1/account-color',
    service='uxc',
    region='us-east-1',
    data={'color': 'green'}
)

# Or use the main request function
response = awshttp.request(
    uri='https://my-api.execute-api.us-east-1.amazonaws.com/prod/endpoint',
    method='POST',
    service='execute-api',
    data='{"key": "value"}',
    headers={'content-type': 'application/json'}
)
```

## Features

- Automatic AWS credential detection (IAM roles, environment variables, ~/.aws/credentials)
- Support for all AWS services (including undocumented Console APIs)
- Simple requests-like interface
- Retry logic with exponential backoff
- JSON helpers for API calls
- Environment variable configuration
- Minimal dependencies (boto3, requests)

## Automating Web Console Actions

Many AWS Console features don't have official CLI/SDK support. Use browser DevTools to capture the API calls:

1. Open AWS Console in your browser
2. Open DevTools (F12) → Network tab
3. Perform the action you want to automate
4. Find the API call in the Network tab
5. Copy the URL, method, headers, and body
6. Replicate with awshttp!

**Example: Change AWS Console account color**

```python
import awshttp

# This API isn't in the AWS SDK, but we can call it directly!
response = awshttp.put_json(
    uri='https://uxc.us-east-1.api.aws/v1/account-color',
    service='uxc',  # Service name from the URL
    region='us-east-1',
    data={'color': 'green'}
)

print(f"Status: {response.status_code}")
print(f"Response: {response.text}")
```

**Tips for finding service names:**
- Look at the URL: `https://SERVICE.REGION.api.aws/...`
- Common services: `uxc` (console UI), `execute-api` (API Gateway), `s3`, `ec2`
- Check the `authorization` header in DevTools for the service name

**Advanced usage with retry:**

```python
# Retry failed requests automatically
@awshttp.with_retry(retries=5, backoff=2.0)
def reliable_api_call():
    return awshttp.post_json(
        uri='https://api.example.com/endpoint',
        service='execute-api',
        data={'action': 'process'},
        timeout=30
    )

response = reliable_api_call()
```

## API Reference

### awshttp.request(uri, method='GET', service='execute-api', region=None, headers=None, data='', verify=True, allow_redirects=False, timeout=None, session=None)

Main function for making signed AWS requests.

**Parameters:**
- `uri` (str): Full URL to request
- `method` (str): HTTP method (GET, POST, PUT, DELETE, PATCH)
- `service` (str): AWS service name for signing
- `region` (str | None): AWS region (auto-detects if None)
- `headers` (dict | None): HTTP headers
- `data` (str | bytes): Request body
- `verify` (bool): Verify SSL certificates
- `allow_redirects` (bool): Follow redirects
- `timeout` (float | None): Request timeout in seconds
- `session` (boto3.Session | None): Boto3 session for credential reuse

**Returns:** `requests.Response` object

### Convenience methods

- `awshttp.get(uri, **kwargs)` - GET request
- `awshttp.post(uri, data='', **kwargs)` - POST request
- `awshttp.put(uri, data='', **kwargs)` - PUT request
- `awshttp.delete(uri, **kwargs)` - DELETE request
- `awshttp.patch(uri, data='', **kwargs)` - PATCH request
- `awshttp.post_json(uri, data={}, **kwargs)` - POST with JSON serialization
- `awshttp.put_json(uri, data={}, **kwargs)` - PUT with JSON serialization

### Retry decorator

```python
@awshttp.with_retry(retries=3, backoff=1.0)
def my_api_call():
    return awshttp.get('https://api.example.com/endpoint')
```

### Environment variables

- `AWSHTTP_TIMEOUT` - Default timeout in seconds
- `AWSHTTP_VERIFY_SSL` - SSL verification (true/false)

## Project Structure

```
awshttp/
├── awshttp/          # Main package
├── tests/            # Test suite
├── examples/         # Usage examples
├── docs/             # Documentation
└── .github/          # GitHub Actions workflows
```

## Development

```bash
# Using uv (recommended)
uv sync --all-extras
uv run pytest tests/

# Or using make
make dev    # Install with dev dependencies
make test   # Run tests
make build  # Build package
```

## License

MIT
