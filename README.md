# Install Docker on Debian 

Ansible Role and Playbooks to install [Docker CE](https://docs.docker.com/engine/installation/linux/docker-ce/debian/) and [Docker Compose](https://docs.docker.com/compose/install/) on Debian Stretch.

This role is best imported into another repo which needs Docker, using `ansible-galaxy`:

```bash
ansible-galaxy install -r requirements.yml --force -p roles 
```

Where the `requirements.yml` file contains:

```yml
---
- name: docker
  src: https://git.coop/webarch/docker.git
  version: master
  scm: git
```

## Ansible 2.4

Debian Stretch ships with Ansible 2.2 and this is now rather old, so to update your local machine to 2.4 from [Debian Backports](https://backports.debian.org/), first add the backports repo (in this case using a UK based mirror which supports HTTPS) and then install Ansible:

```bash
sudo -i # or run `su - root` if you are not a sudoer
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

Install Docker CE on your local machine (assuming you are a sudoer, you will need to run `sudo -i` first if you don't have password-less sudo an dthen change to the directory where this repo has been cloned) and add yourself to the `docker` group:

```bash
ansible-playbook docker.yml --extra-vars "hostname=localhost" -i "localhost," -c local
sudo -i
usermod -a -G docker ${SUDO_USER}
exit
```

NOTE: If you have a different `control_path_dir` set in `~/.ansible.cfg` from the default in `/etc/ansible/ansible.cfg` then you might need to run this as `root` rather than using `sudo`:

```bash
sudo -i # or run `su - root` if you are not a sudoer
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

Install Docker Compose on your local machine (assuming you are a sudoer, you might need to run `sudo -i ; exit` if you don't have password-less sudo):

```bash
ansible-playbook docker_compose.yml --extra-vars "hostname=localhost" -i "localhost," -c local 
```

NOTE: If you have a different `control_path_dir` set in `~/.ansible.cfg` from the default in `/etc/ansible/ansible.cfg` then you might need to run this as `root` rather than using `sudo`:


```bash
sudo -i # or run `su - root` if yo are not a sudoer
ansible-playbook docker_compose.yml --extra-vars "hostname=localhost" -i "localhost," -c local
```

