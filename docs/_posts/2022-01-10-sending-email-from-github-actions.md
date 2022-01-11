---
title: Sending Email from GitHub Actions
---

<a target="_blank" href="https://github.com/marketplace/actions/cinotify-email">View on Marketplace</a>
    &middot;
    <a target="_blank" href="https://github.com/cinotify/github-action">View Source</a>

Here is an example showing how to start sending email notifications from a GitHub Actions Workflow:

<pre><code class='language-yml'>
jobs:
  First-Step:
    runs-on: ubuntu-latest
    steps:
      - run: echo "Starting GitHub Actions Job"
      - uses: cinotify/github-action@main
        with:
          to: 'example@example.com'
          subject: 'building main'
          body: 'This is a notification from GitHub actions.'
</code></pre>

There is also the [starter template](https://github.com/cinotify/github-actions-example) which can be used as a starting point for setting up a GitHub Actions Workflow with email notifications.