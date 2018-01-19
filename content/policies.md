---
layout: page
title: Policies
---
{% comment %}
This space is available to add some overall context across all policy areas your company uses.
Consider explaining the rationale for the areas that have been identified and named.
{% endcomment %}

## Policy areas
<ul class="child-list">
  {% assign sorted = page.children | sort:"title" %}
  {% for policy_area in sorted %}
    <li>
      <h2>
        <a class="child-link" href="{{ policy_area.url | relative_url }}">{{ policy_area.title | escape }}</a>
      </h2>
      {% if policy_area.excerpt %}
      <p class="child-excerpt"><em>{{ policy_area.excerpt }}</em></p>
      {% endif %}
    </li>
  {% endfor %}
</ul>