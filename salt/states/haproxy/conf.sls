{% from "haproxy/map.jinja" import haproxy with context %}

include:
  - haproxy

haproxy_conf:
  file.managed:
    - name: {{ haproxy.conf }}
    - source: {{ haproxy.filename }}
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - watch_in:
      - service: haproxy
    
