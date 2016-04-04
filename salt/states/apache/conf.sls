{% from "apache/map.jinja" import apache with context %}

include:
  - apache

apache_conf:
  file.managed:
    - name: {{ apache.conf }}
    - source: {{ apache.filename }}
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - watch_in:
      - service: apache

index_page:
  file.managed:
    - name: '/var/www/html/index.html'
    - source: salt://apache/files/index.html.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644

{% if salt['grains.get']('os') == 'Ubuntu' %}
ubuntu_default_vhost:
  file.managed:
    - name: {{ apache.default_vhost }}
    - source: {{ apache.default_vhost_file }}
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: apache_conf

ubuntu_default_vhost_symlink:
  file.symlink:
    - name: /etc/apache2/sites-enabled/000-default.conf
    - target: {{ apache.default_vhost }}
    - require: 
      - file: ubuntu_default_vhost
{% endif %}
