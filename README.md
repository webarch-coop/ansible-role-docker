# Install Docker on Debian 

Ansible Role and Playbooks to install [Docker CE](https://docs.docker.com/engine/installation/linux/docker-ce/debian/) and [Docker Compose](https://docs.docker.com/compose/install/) on Debian Stretch and Buster.

This role is best imported into another repo which needs Docker, using Ansible Galaxy (the following command will download / update this repo in `roles/docker`):

```bash
ansible-galaxy install -r requirements.yml --force
```

Where the `requirements.yml` file, in the repo you want to pull this role into, contains:

```yml
---
- name: docker
  src: https://git.coop/webarch/docker.git
  version: master
  scm: git
```

The galaxy path for installing the roles can be set in a `ansible.cgf` file like this:

```yml
[defaults]
retry_files_enabled = False
pipelining = True
inventory = hosts.yml
roles_path = galaxy/roles
allow_world_readable_tmpfiles = True
force_color = 1
```

Best to also add the role to the `.gitignore` file in the repo you want to pull this role into:

```
galaxy/roles/docker
```

This repo contains symlinks in the `roles` directory in order that it can be use as a stand alone repo to install Docker CE and Docker Compose without the use of Ansible Galaxy. 

## Optional Variables

The Docker Compose role did behave as follows but will now get the latest version form GitHub, this needs updating: *If you want to install Docker Compose then you need to define the `docker_compose_version` variable, see the [releases page](https://github.com/docker/compose/releases) to get the string, for example `1.24.1`, if this variable isn't defined then `docker-compose` won't be installed.*

If the `docker_nameservers` array is defined then the IP addresses they contain will be added to `/etc/docker/daemon.json` as `dns` servers for Docker (by default Docker uses Google DNS servers) and if they are undefined nothing will be done.

If `docker_munin_node_install` is set to `True` then `munin-node` will be configured for the Webarchitects Munin server, if the variable isn't defined then this will be skipped. 

## Install Docker CE

The [Docker CE release notes](https://docs.docker.com/release-notes/docker-ce/) should list the latest version but they are not always updated as often as versions are released.

To use this repo as a stand alone repo, without using `ansible-galaxy`, clone it and then install Docker CE on a remote server using `sudo`:

```bash
export SERVERNAME="example.org"
ansible-playbook docker.yml -i ${SERVERNAME}, -e "hostname=${SERVERNAME}"
```

Or install Docker CE on a remote server as `root`:

```bash
export SERVERNAME="example.org"
ansible-playbook docker.yml -u root -i ${SERVERNAME}, -e "hostname=${SERVERNAME}"
```

You can also use this repo to install Docker CE on your local machine and then add yourself to the `docker` group:

```bash
sudo -i
ansible-playbook docker.yml --extra-vars "hostname=localhost" -i "localhost," -c local
usermod -a -G docker ${SUDO_USER}
exit
```

## Install or Upgrade Docker Compose

You can find which the latest version of `docker-compose` is on the [Docker Compose Releases page](https://github.com/docker/compose/releases).

Install on a remote server using `sudo`: 

```bash
export SERVERNAME="example.org"
ansible-playbook docker_compose.yml -i ${SERVERNAME}, -e "hostname=${SERVERNAME}"
```

Install on a remote server as `root`:

```bash
export SERVERNAME="example.org"
ansible-playbook docker_compose.yml -u root -i ${SERVERNAME}, -e "hostname=${SERVERNAME}"
```

Install Docker Compose on your local machine: 

```bash
sudo -i
ansible-playbook docker_compose.yml --extra-vars "hostname=localhost" -i "localhost," -c local 
```

