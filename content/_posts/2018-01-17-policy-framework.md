---
layout: post
title:  "Starting a modular policy framework"
date:   2018-01-17 00:05:00 +0000
categories: jekyll policy
---
I intend to build a general modular starting point for the creation of company policy documentation. The aim is to write self-contained pieces of content without repetition that can be built into either wiki-like modular hypertext with navigation aids, or fully formed policy manuals as needs demand.

The aim of this structure is to make policies more transparent to inspection, discussion (_even challenge_) and easier to adopt, adapt and modify over time. It is meant to provide an agile framework to do "_policy stuff_".

This implementation will be built assuming the following as a foundation:
* __Git__ - to provide structured version management and auditability to policy changes
* __Markdown__ - as a broadly supported markup standard that can easily be integrated with other tools (e.g. GitHub pages or DropBox Paper)
* __Jekyll__ - as a tool-chain to transform the raw content into rich document formats

The following lists resources I have identified for inspiration and to borrow elements from:
* [How GitHub uses GitHub to document GitHub](https://github.com/blog/1939-how-github-uses-github-to-document-github) - this is the original inspiration that started me down this path
* [Divshot on Advanced Jekyll Plugins](https://divshot.com/blog/web-development/advanced-jekyll-features) - good examples for scripting and custom plugin development
* [Jekyll-admin](https://github.com/jekyll/jekyll-admin) - option to make editing more accessible
* [documentation-theme-jekyll](https://github.com/tomjoht/documentation-theme-jekyll) - very extensive styling and navigation features; lots to borrow here!
* [jekyll-materialdocs](https://github.com/chromatical/jekyll-materialdocs) - I like the clean sparse look of material here
* [jekyll-git_metadata](https://github.com/ivantsepp/jekyll-git_metadata) - plugin to consider for pulling audit trail info into the page directly from git
* [jekyll-version-plugin](https://github.com/rob-murray/jekyll-version-plugin) - as per previous
* [jekyll-toc](https://github.com/toshimaru/jekyll-toc) - plugin to check for ideas on auto-generating a TOC in the sidebar for all pages
* [jekyll-numbered-headings](https://github.com/muratayusuke/jekyll-numbered-headings) - plugin that may be useful to make policy sections easier to reference?
* [jekyll-extlinks](https://github.com/d-ogarkov/jekyll-extlinks) - plugin to adorn external links; harvest ideas on link processing to get automatic cross-referencing
* [extended-markdown-filter](https://github.com/gjtorikian/extended-markdown-filter) - plugin with markdown extensions to support some additional GitHub Pages conventions that might be useful (callouts, accordions, etc)