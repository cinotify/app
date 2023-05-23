---
layout: page
title: npm
---

# npm

A JavaScript client is provided via npm.

[View on npmjs.com](https://www.npmjs.com/package/@cinotify/js)
[View Source](https://github.com/cinotify/js)

## Usage

```js
const {email} = require("@cinotify/js");
email({
  to: 'example@example.com',
  subject: 'hello',
  body: 'hey there from js'
})
```
