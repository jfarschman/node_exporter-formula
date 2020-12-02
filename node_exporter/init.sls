# vim: ft=sls
# Init node_exporter
{%- from "node_exporter/map.jinja" import node_exporter with context %}
{# Below is an example of having a toggle for the state #}

{% if node_exporter.enabled %}
include:
  - node_exporter.install
  - node_exporter.config
  - node_exporter.service
{% else %}
'node_exporter-formula disabled':
  test.succeed_without_changes
{% endif %}
