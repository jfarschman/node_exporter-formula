# vim: ft=sls
# How to configure node_exporter
{%- from "node_exporter/map.jinja" import node_exporter with context %}

node_exporter_defaults:
  file.managed:
    - name: /etc/default/node_exporter
    - source: salt://node_exporter/files/default-node_exporter.jinja
    - template: jinja
