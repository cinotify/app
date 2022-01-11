---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: default
title: Documentation
---

# CI Notify Documentation

{% for post in site.posts %}
  <a href='{{post.url | prepend: site.baseurl}}'>{{post.title}} </a>
{% endfor %}