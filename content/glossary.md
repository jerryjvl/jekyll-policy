---
layout: page
title: Glossary
---
| Term | Definition |
|:-----|:-----------|{% for item in site.data.glossary %}
| {{ item.term }} | {{ item.definition }} |{% endfor %}