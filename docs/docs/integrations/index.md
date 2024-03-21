---
layout: page
title: Integrations
---

# Integrations

Several third party applications allow integrating over email. Since CI
Notify provides zero-configuration email notifications, it's possible
to integrate with third party applications without having to manage API keys.

## Slack

[View Slack Documentation](https://slack.com/help/articles/206819278-Send-emails-to-Slack)

Once you generate a Slack email address, you can use that to send
notifications from GitHub Actions, CircleCI, or the REST API. Here's one example:

```yaml
uses: cinotify/github-action@main
with:
  to: 'email-abc123456@mycompany.org.slack.com'
  subject: 'building main'
  body: 'This is a notification from GitHub actions.'
```

## Microsoft Teams

[View Teams Documentation](https://support.microsoft.com/en-au/office/send-an-email-to-a-channel-in-teams-d91db004-d9d7-4a47-82e6-fb1b16dfd51e)

Once you generate a Teams email address, you can use that to send
notifications from GitHub Actions, CircleCI, or the REST API. Here's one example:

```yaml
uses: cinotify/github-action@main
with:
  to: 'email-abc123456@mycompany.org'
  subject: 'building main'
  body: 'This is a notification from GitHub actions.'
```
