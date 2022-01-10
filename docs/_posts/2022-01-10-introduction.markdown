---
title:  "Introduction"
date:   2222-01-10 13:09:49 -0600
categories: engineering
---

 CI Notify provides a notification service for restricted tested environments with limited resources and permissions. Typically, continuous integration tests and builds run within a docker container that does not have access to send mail over SMTP. Additionally, this service provides a way to send notifications without leaking SMTP credentials of your company domain to a build environment.
