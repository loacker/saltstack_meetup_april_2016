{% from "haproxy/map.jinja" import haproxy with context %}

haproxy:
  pkg.installed:
    - name: {{ haproxy.pkg }}
  service.running:
    - name: {{ haproxy.service }}
{% if salt['grains.get']('os') == 'Ubuntu' %}
  file.managed:
    - name: /etc/default/haproxy
    - source: salt://haproxy/files/ubuntu/haproxy
    - watch_in:
      - service: haproxy
{% endif %}
