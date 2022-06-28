# Webarchitects Ansible Docker and Docker Compose Role

[![pipeline status](https://git.coop/webarch/docker/badges/master/pipeline.svg)](https://git.coop/webarch/docker/-/commits/master)

Ansible Role and to install [Docker CE](https://docs.docker.com/engine/installation/linux/docker-ce/debian/), [Docker Compose](https://github.com/docker/compose#docker-compose-v2) and the last version of `docker-compose` version 1, [Docker Compose 1.29.2 ](https://github.com/docker/compose/tree/5becea4ca9f68875334c92f191a13482bcd6e5cf#docker-compose), and [Compose Switch](https://github.com/docker/compose-switch) on Debian and Ubuntu.

See the [defaults/main.yml](defaults/main.yml) for the default settings.

| Variable name                | Default value                                        | Comment                                                                                                                                                                                                       |
|------------------------------|------------------------------------------------------|-----------------------------------------------------------------------|
| `docker`                     | `true`                                               | Set to false for the tasks in this role to be skipped                 |
| `docker_compose`             | `true`                                               | Set to false for the `docker-compose-plugin` not to be installed      |
| `docker_compose_v1`          | `false`                                              | Set to `true` for Docker Compose version 1 to be installed            |
| `docker_compose_version_v1`  | `1.29.2`                                             | The version number of Docker Compose version 1 to be installed        |
| `docker_daemon`              | `storage-driver: overlay2` and `log-driver: syslog`  | YAML to be converted to JSON and written to `/etc/docker/daemon.json` |

The primary URL of this repo is [`https://git.coop/webarch/docker`](https://git.coop/webarch/docker) however it is also [mirrored to GitHub](https://github.com/webarch-coop/ansible-role-docker) and [available via Ansible Galaxy](https://galaxy.ansible.com/chriscroome/docker).

If you use this role please use a tagged release, see [the release notes](https://git.coop/webarch/docker/-/releases).

See also the [localhost repo](https://git.coop/webarch/localhost) for using this role to install Docker and Docker Compose on the `localhost`.
