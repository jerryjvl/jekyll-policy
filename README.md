---
layout: page
title: About
permalink: /about/
---
# jekyll-policy
Jekyll setup designed for maintaining company policy inside git.

This is still in a very rough-and-ready state. The formatting of tables in particular and some of the lists isn't very nice... to say the least. And I still need to implement a plugin to make cross-referencing between content types easier and to automatically populate back-references in tables on the specific content elements.

But... it's a start, and it shows a bit of the vision.

# TODO
* Plugin that parses all links and makes them available via a property on the referenced page
* Plugin for a custom linking type that makes referencing between criteria, policies, responsibilities and procedures less verbose
* Implement easy glossary links with tool-tips containing the glossary entry text
* Implement tool-tips for links to pages with excerpts... because it's cool
* Implement plugin to pull in link + title + excerpt to a targeted page in a neat page-content format
* Do *lots* to make content look nicer, specifically the auto-generated cross reference tables and lists need some work
* Pull in git details on pages to capture last revision date and author
* Create an automatic navigation side-bar... cover both site-nav and in-page nav for larger pages