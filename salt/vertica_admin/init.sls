{% set APP_NAME = 'vertica_admin' %}
{% set PARENT_APP_NAME = 'vertica' %}
{% set HOME_DIR = '/opt/yp/pdsdw' %}
{% set APP_HOME_DIR = '{{ HOME_DIR }}/{{ APP_NAME }}' %}
{% set CRON_DIR = '{{ HOME_DIR }}/{{ APP_NAME }}/etc/cron.d' %}

{% set cluster = salt['grains.get']('CLUSTER') | join('') %}
{% set datacenter = salt['grains.get']('DATACENTER') | join('') %}
{% set environment = salt['grains.get']('ENVIRONMENT') | join('') %}
{% set maven = 'https://maven.int.yp.com/service/local/repositories' %}
{% set mogwai = 'http://mogwai:7700/pkg.upstream' %}
{% set service = salt['grains.get']('SERVICES') | join('') %}


# Start managed files

{{ APP_NAME }} - /root/.bashrc:
  file.append:
    - name: /root/.bashrc
    - text:
      - export GIT_SSH=~/.git-ssh.sh

{{ APP_NAME }} - /root/.git-ssh.sh:
  file.managed:
    - name: /root/.git-ssh.sh
    - source: salt://{{ PARENT_APP_NAME }}/{{ APP_NAME }}/root/.git-ssh.sh
    - user: root
    - group: root
    - mode: 755

/opt/yp/pdsdw/vertica_admin:
  file.directory:
    - user: pdsauto
    - group: roleusers
    - mode: 775
    - makedirs: True
    - recurse:
      - user
      - group

/opt/yp/pdsdw/vertica_admin/conf:
  file.recurse:
    - source: salt://{{ PARENT_APP_NAME }}/{{ APP_NAME }}{{ HOME_DIR }}/{{ APP_NAME }}/conf
    - dir_mode: 775
    - file_mode: 664
    - user: pdsauto
    - group: roleusers
    - include_empty: True

/opt/yp/pdsdw/vertica_admin/bin:
  file.recurse:
    - source: salt://{{ PARENT_APP_NAME }}/{{ APP_NAME }}{{ HOME_DIR }}/{{ APP_NAME }}/bin
    - dir_mode: 775
    - file_mode: 775
    - user: pdsauto
    - group: roleusers
    - include_empty: True

/opt/yp/pdsdw/vertica_admin/sql:
  file.recurse:
    - source: salt://{{ PARENT_APP_NAME }}/{{ APP_NAME }}{{ HOME_DIR }}/{{ APP_NAME }}/sql
    - user: pdsauto
    - group: roleusers
    - dir_mode: 775
    - file_mode: 644
    - makedirs: True
    - include_empty: True

{{ APP_NAME }} - crontabs:
  file.recurse:
    - name: /etc/cron.d
    - source: salt://{{ PARENT_APP_NAME }}/{{ APP_NAME }}/etc/cron.d
    - file_mode: 644
    - template: jinja

/opt/yp/pdsdw/vertica_admin/var/log:
  file.directory:
    - user: pdsauto
    - group: roleusers
    - mode: 775
    - makedirs: True

/opt/yp/pdsdw/vertica_admin/backup:
  file.directory:
    - user: pdsauto
    - group: roleusers
    - mode: 775
    - makedirs: True

{{ APP_NAME }} - stash.int.yp.com known_host:
  ssh_known_hosts:
    - name: stash.int.yp.com
    - present
    - user: pdsauto
    - fingerprint: bc:1b:b5:3a:8f:6b:29:b6:37:4e:9a:fe:4b:44:27:39

{{ APP_NAME }} - ssh://git@stash.int.yp.com/pdsops/vertica-backup.git:
  git.latest:
    - name: ssh://git@stash.int.yp.com/pdsops/vertica-backup.git
    - target: {{ HOME_DIR }}/{{ APP_NAME }}
    - user: pdsauto
    - identity: 
      - /home/pdsauto/.ssh/id_rsa
    - require:
      - ssh_known_hosts: {{ APP_NAME }} - stash.int.yp.com known_host


# End managed files


