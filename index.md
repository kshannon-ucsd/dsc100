---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults
title: 🏠 Home
layout: home
nav_exclude: false
nav_order: 1
---

{% assign course_vars = site.data[site.data_folder].course %}
{% assign staff_vars = site.data[site.data_folder].staff %}
{% assign calendar = site.data[site.data_folder].calendar %}
{% assign staff = staff_vars[0] %} <!-- Cannot change this to instructor = because it will break the staffer.html include. If this needs to be instructor, then include.staff needs to be used as the variable in staffer.html  -->

# {{ site.tagline }}

{: .mb-2 }
{{ site.description }} <span title="https://jarv.is/" class="wave">👋</span>
{: .fs-6 .fw-300 }

{{ course_vars.quarter }}
{: .md-badge-purple }

{{ course_vars.building }}
{: .md-badge-purple }

{{ course_vars.timings }}
{: .md-badge-purple }

{% include staffer.html staff=staff nobio='true' %}


<!-- **{{ course_vars.announcement.text }}** -->

{% for week in calendar %}
  {% include week.html week=week %}
{% endfor %}