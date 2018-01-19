---
layout: page
title: Procedures
---
{% comment %}
This space is available to add some overall context across all procedures your company defines.
Note that this should only be used for procedures that are in service of the documented policies,
if other procedures exist, it would be best to keep them elsewhere since they will not link back
to any of the other content anyway.
{% endcomment %}

## Procedures
{% assign grouped = page.descendants | group_by:"category" | sort:"name" %}
{% for group in grouped %}
#### {{ group.name | capitalize }}

<ul class="child-list-condensed">
  {% assign sorted = group.items | sort:"title" %}
  {% for procedure in sorted %}
    <li>
      <h2>
        <a class="child-link-condensed" href="{{ procedure.url | relative_url }}">{{ procedure.title | escape }}</a>
      </h2>
      {% if procedure.excerpt %}
      <p class="child-excerpt-condensed"><em>{{ procedure.excerpt }}</em></p>
      {% endif %}
    </li>
  {% endfor %}
</ul>
{% endfor %}