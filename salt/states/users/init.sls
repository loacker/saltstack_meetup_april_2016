{% for user, args in pillar['users'].iteritems() %}

{{ user }}_group:
  group.present:
    - name: {{ user }}
    - gid: {{ args['gid'] }}

{{ user }}:
  user.present:
    - home: {{ args['home'] }}
    - shell: {{ args['shell'] }}
    - uid: {{ args['uid'] }}
    - gid: {{ args['gid'] }}
    - require:
      - group: {{ user }}

{{ user }}_key.pub:
  ssh_auth:
    - present
    - user: {{ user }}
    - source: salt://users/keys/{{ user }}.pub
    - require:
      - user: {{ user }}

{{ user }}_sudoers:
  file.managed:
    - name: /etc/sudoers.d/{{ user }}.conf
    - source: salt://users/sudoers.jinja
    - require:
      - user: {{ user }}

{% endfor %}
