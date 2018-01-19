---
layout: page
title: Criteria
---
{% comment %}
This space is available to add some overall context across all criteria bundles your company uses.
Consider explaining the rationale for the bundles the company has chosen to mandate.
{% endcomment %}

## Criteria bundles
<ul class="child-list">
  {% for criteria_bundle in page.children %}
    <li>
      <h2>
        <a class="child-link" href="{{ criteria_bundle.url | relative_url }}">{{ criteria_bundle.title | escape }}</a>
      </h2>
      {% if criteria_bundle.criteria_type %}
      <span class="child-meta">{{ criteria_bundle.criteria_type | capitalize }} criteria</span>
      {% endif %}
      {% if criteria_bundle.excerpt %}
      <p class="child-excerpt"><em>{{ criteria_bundle.excerpt }}</em></p>
      {% endif %}
    </li>
  {% endfor %}
</ul>