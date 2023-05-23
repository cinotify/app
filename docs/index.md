---
layout: home
title: Getting Started
nav_order: 0
---

# CI Notify Documentation

CI Notify provides a notification service for restricted tested environments
with limited resources and permissions.

Typically, continuous integration tests and builds run within a docker container that does not have access to send mail over SMTP. Additionally, this service provides a way to send notifications without leaking SMTP credentials of your company domain to a build environment.
