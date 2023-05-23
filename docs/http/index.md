---
title: HTTP API
layout: page
---

# HTTP API

The HTTP API is how emails are sent from Continuous Integration environments.

## `POST /api/notify`

### Parameters

|name|type|required|
|---|---|
|to|string|true|
|subject|string|true|
|body|string|false|

### Example

#### application/x-www-form-urlencoded
```bash
curl --request POST 'https://www.cinotify.cc/api/notify' \
  -d "to=example@example.com&subject=building main&body=hello."
```

#### json
```bash
curl -X POST 'https://www.cinotify.cc/api/notify' \
  -H "Content-Type: application/json" \
  -d '{"to":"example@example.com", "subject": "building main", "body":"hello."}'
```
