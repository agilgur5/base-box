#!/bin/sh

# switch to mounted location automatically on SSH
# services is the most often used location inside the mount
echo 'cd /vagrant/services' >> /home/vagrant/.bashrc;

echo 'Installing Docker...';
curl -sSL https://get.docker.com | sh > /dev/null;
# add vagrant user to the docker group
usermod -aG docker vagrant;

echo 'Installing Docker-Compose...';
baseurl='https://github.com/docker/compose/releases/download/1.9.0/';
suffix="docker-compose-$(uname -s)-$(uname -m)";
curl -sSL "$baseurl$suffix" > /usr/local/bin/docker-compose;
chmod +x /usr/local/bin/docker-compose;

echo 'Installing AWS CLIs + SDKs...';
apt-get install -qqy python-pip > /dev/null;
pip -q install awscli awsebcli boto > /dev/null;
