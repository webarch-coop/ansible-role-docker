#!/bin/bash

sudo ansible-playbook --extra-vars "hostname=localhost munin_node_install=false" -i "localhost," -c local docker_compose.yml 
