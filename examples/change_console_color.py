#!/usr/bin/env python
"""Test script to change AWS Console account color"""

import awshttp

# Make the request using JSON helper
response = awshttp.put_json(
    uri='https://uxc.us-east-1.api.aws/v1/account-color',
    service='uxc',
    region='us-east-1',
    data={'color': 'teal'}
)

print(f"Status: {response.status_code}")
print(f"Response: {response.text}")

# Alternative using main request function
response2 = awshttp.request(
    uri='https://uxc.us-east-1.api.aws/v1/account-color',
    method='PUT',
    service='uxc',
    region='us-east-1',
    headers={'content-type': 'application/json'},
    data='{"color": "blue"}'
)

print(f"\nAlternative method - Status: {response2.status_code}")
print(f"Response: {response2.text}")
