dev:
  'G@role:webserver':
    - apache.conf
  'role:proxy':
    - match: grain
    - haproxy.conf
  'salt':
    - users
