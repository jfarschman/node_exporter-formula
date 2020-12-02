# vim: ft=sls
# How to install node_exporter
{%- from "node_exporter/map.jinja" import node_exporter with context %}

node_exporter_group:
  group.present:
    - name: {{ node_exporter.group }}
    - system: True

node_exporter_user:
  user.present:
    - name: {{ node_exporter.user }}
    - home: /home/node_exporter
    - gid: {{ node_exporter.group }}
    - shell: /bin/false
    - system: True
