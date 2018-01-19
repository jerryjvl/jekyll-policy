---
layout: page
title: Responsibilities
---
{% comment %}
This space is available to add some overall context across all responsibilities your company defines.
Note that responsibilities are in most cases the entry point for humans actually doing all this.
{% endcomment %}

## Responsibilities by Owner
{% assign grouped = page.descendants | group_by:"owner" | sort:"name" %}
{% for group in grouped %}
#### Owned by "{{ group.name }}"

{% assign sorted = group.items | sort:"title" %}
| Title | Enforcer |
|:------|:---------|{% for responsibility in sorted %}
| [{{ responsibility.title }}]({{ responsibility.url }}) | {{ responsibility.enforcer }} |{% endfor %}
{% endfor %}

## Responsibilities by Enforcer
{% assign grouped = page.descendants | group_by:"enforcer" | sort:"name" %}
{% for group in grouped %}
#### Enforced by "{{ group.name }}"
{% assign items = group.items | reverse %}

{% assign sorted = group.items | sort:"title" %}
| Title | Owner |
|:------|:------|{% for responsibility in sorted %}
| [{{ responsibility.title }}]({{ responsibility.url }}) | {{ responsibility.owner }} |{% endfor %}
{% endfor %}
