#!/binb/bash
## sagas - workstation node
## install the latest docker
curl -fsSL get.docker.com | sh
## use china mirror
curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://e48b256f.m.daocloud.io

# Restart docker to make sure we get the latest version of the daemon if there is an upgrade
sudo service docker restart
# Make sure we can actually use docker as the vagrant user
sudo usermod -aG docker vagrant

# docker-compose
sudo apt-get install -y python-pip
sudo pip install docker-compose

