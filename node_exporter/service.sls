# vim: ft=sls
# Manage service for service node_exporter
{%- from "node_exporter/map.jinja" import node_exporter with context %}

'node_exporter-service not configured':
  test.succeed_without_changes

node_exporter_service_unit:
  file.managed:
{%- if grains.get('init') == 'systemd' %}
    - name: /etc/systemd/system/node_exporter.service
    - source: salt://node_exporter/files/node_exporter.systemd.jinja
{%- elif grains.get('init') == 'upstart' %}
    - name: /etc/init/node_exporter.conf
    - source: salt://node_exporter/files/node_exporter.upstart.jinja
{%- endif %}
    - require_in:
      - file: node_exporter_service

node_exporter_service:
  service.running:
    - name: node_exporter
    - enable: True
    - reload: True
