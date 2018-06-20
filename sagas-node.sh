#!/binb/bash
curl -fsSL get.docker.com | sh

# Restart docker to make sure we get the latest version of the daemon if there is an upgrade
sudo service docker restart
# Make sure we can actually use docker as the vagrant user
sudo usermod -aG docker vagrant

# docker-compose
sudo apt-get install -y python-pip
sudo pip install docker-compose

