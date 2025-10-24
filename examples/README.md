# Examples

## Change AWS Console Color

Demonstrates calling an undocumented AWS Console API:

```bash
python examples/change_console_color.py
```

## Basic Usage

```python
import awshttp

# Simple GET request
response = awshttp.get(
    uri='https://my-api.execute-api.us-east-1.amazonaws.com/prod/items',
    service='execute-api'
)
print(response.json())

# POST with JSON
response = awshttp.post_json(
    uri='https://my-api.execute-api.us-east-1.amazonaws.com/prod/items',
    service='execute-api',
    data={'name': 'example', 'value': 123}
)

# With retry logic
@awshttp.with_retry(retries=3)
def reliable_request():
    return awshttp.get(
        uri='https://my-api.execute-api.us-east-1.amazonaws.com/prod/items',
        service='execute-api',
        timeout=10
    )

response = reliable_request()
```
