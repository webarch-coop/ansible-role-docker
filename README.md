Ansible Playbooks to install [Docker CE](https://docs.docker.com/engine/installation/linux/docker-ce/debian/) and [Docker Compose](https://docs.docker.com/compose/install/) on Debian Stretch.

## Install Docker

```bash
export SERVERNAME="example.org"
ansible-playbook docker.yml -u root -i ${SERVERNAME}, -e "hostname=${SERVERNAME}"
```

## Install or Upgrade Docker Compose

```bash
export SERVERNAME="example.org"
ansible-playbook docker_compose.yml -u root -i ${SERVERNAME}, -e "hostname=${SERVERNAME}"
```





