---
title: Sending Email from a CircleCI workflow
---

<a target="_blank" href="https://circleci.com/developer/orbs/orb/cinotify/email">View on Orb Registry</a>
    &middot;
    <a target="_blank" href="https://github.com/cinotify/circleci-orb">View Source</a>

Here is an example of how to start sending emails from within a CircleCI workflow, no matter the environment.

```yml
orbs:
  email: cinotify/email@1.2.0

workflows:
  example-workflow:
    jobs:
      - email/send:
          body: 'Configure this notification at https://www.cinotify.cc/'
          subject: CircleCI job started
          to: example@example.com
```

To learn more about this orb, view CI Notify on the CircleCI Orb registry: <https://circleci.com/developer/orbs/orb/cinotify/email>