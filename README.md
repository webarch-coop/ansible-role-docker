# Webarchitects Ansible Docker Role

[![pipeline status](https://git.coop/webarch/docker/badges/master/pipeline.svg)](https://git.coop/webarch/docker/-/commits/master)

Ansible Role to install [Docker CE](https://docs.docker.com/engine/installation/linux/docker-ce/debian/) on Debian and Ubuntu.

This role can also optionally install the last version of `docker-compose` version 1, [Docker Compose 1.29.2](https://github.com/docker/compose/tree/5becea4ca9f68875334c92f191a13482bcd6e5cf#docker-compose) and [Compose Switch](https://github.com/docker/compose-switch).

See the [defaults/main.yml](defaults/main.yml) for the default settings and [vars/main.yml](vars/main.yml) for the `gpg` and `apt` variables.

See the [documentation for the Docker daemon config file](https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-configuration-file) for all the options available and convert these to YAML for use by this role, for example:

```yml
docker_daemon:
  storage-driver: overlay2
  log-driver: syslog
  dns:
    - 1.1.1.1
    - 8.8.8.8
    - 9.9.9.9
```

The role uses `.sources` rather than `.list` files for `apt` and it also checks the `gpg` public key used to sign packages against the [vars/main.yml](variables set int his role) and limits what packages can be installed from the Docker repo, based on the Debian wiki page with [instructions to connect to a third-party repository](https://wiki.debian.org/DebianRepository/UseThirdParty).

This role requires [jc](https://github.com/kellyjonbrazil/jc) version `1.20.2` or later to be installed on the Ansible controller using `pip` for the parsing of GPG command output, `jc` can be [installed using Ansible](https://git.coop/webarch/jc/), or simply run:

```bash
pip3 install jc
```

The primary URL of this repo is [`https://git.coop/webarch/docker`](https://git.coop/webarch/docker) however it is also [mirrored to GitHub](https://github.com/webarch-coop/ansible-role-docker) and [available via Ansible Galaxy](https://galaxy.ansible.com/chriscroome/docker).

If you use this role please use a tagged release, see [the release notes](https://git.coop/webarch/docker/-/releases).

See also the [localhost repo](https://git.coop/webarch/localhost) for using this role to install Docker on the `localhost`.
