# vim: ft=sls
# How to install node_exporter
{%- from "node_exporter/map.jinja" import node_exporter with context %}

include:
  - node_exporter.user

node_exporter_tarball:
  archive.extracted:
    - name: {{ node_exporter.install_dir }}
    - source: {{ node_exporter.source }}
    - source_hash: {{ node_exporter.source_hash }}
    - user: {{ node_exporter.user }}
    - group: {{ node_exporter.group }}
    - archive_format: tar
    - if_missing: {{ node_exporter.version_path }}
    - require:
      - sls: node_exporter.user

node_exporter_bin_link:
  file.symlink:
    - name: /usr/local/bin/node_exporter
    - target: {{ node_exporter.version_path }}/node_exporter
    - force: true
    - user: {{ node_exporter.user }}
    - group: {{ node_exporter.group }}
    - file_mode: '0755'
    - require:
      - archive: node_exporter_tarball
