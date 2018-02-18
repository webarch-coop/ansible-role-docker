# Install Docker on Debian 

Ansible Playbooks to install [Docker CE](https://docs.docker.com/engine/installation/linux/docker-ce/debian/) and [Docker Compose](https://docs.docker.com/compose/install/) on Debian Stretch.

## Ansible 2.4

Debian Stretch ships with Ansible 2.2 and this is now rather old, so to update your local machine to 2.4 from [Debian Backports](https://backports.debian.org/), first add the backports repo (in this case using a UK based mirror which supports HTTPS) and then install Ansible:

```bash
sudo -i
echo "deb https://mirrorservice.org/sites/ftp.debian.org/debian/ stretch-backports main" > /etc/apt/sources.list.d/stretch-backports.list
apt update
apt -t stretch-backports install ansible
```

## Install Docker CE

The [Docker CE release notes](https://docs.docker.com/release-notes/docker-ce/) should list the latest version but they are not always updated as often as versions are released.

Install Docker CE on a remote server using `sudo`:

```bash
export SERVERNAME="example.org"
ansible-playbook docker.yml -u root -i ${SERVERNAME}, -e "hostname=${SERVERNAME}"
```

Install Docker CE on a remote server as `root`:

```bash
export SERVERNAME="example.org"
ansible-playbook docker.yml -u root -i ${SERVERNAME}, -e "hostname=${SERVERNAME}"
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

Install locally (assuming you are a sudoer, you might need to run `sudo -i ; exit` if you don't have password-less sudo):

```bash
ansible-playbook --extra-vars "hostname=localhost" -i "localhost," -c local docker_compose.yml
```

NOTE: If you have a different `control_path_dir` set in `~/.ansible.cfg` from the default in `/etc/ansible/ansible.cfg` then you might need to run this as `root` rather than using `sudo`:


```bash
sudo -i
ansible-playbook --extra-vars "hostname=localhost" -i "localhost," -c local docker_compose.yml
```

