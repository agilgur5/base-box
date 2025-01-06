#!/bin/sh

echo 'Installing Docker...';
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
  --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo deb https://apt.dockerproject.org/repo ubuntu-trusty main > \
  /etc/apt/sources.list.d/docker.list;
apt-get update -qq;
apt-get install -qqy docker-engine;
# add vagrant user to the docker group
usermod -aG docker vagrant;

echo 'Installing Docker-Compose...';
baseurl='https://github.com/docker/compose/releases/download/1.6.0/';
suffix="docker-compose-$(uname -s)-$(uname -m)";
curl -sSL "$baseurl$suffix" > /usr/local/bin/docker-compose;
chmod +x /usr/local/bin/docker-compose;

echo 'Installing Overcommit...';
apt-get install -qqy ruby-full > /dev/null;
gem install overcommit -- --silent > /dev/null;
# hook dependencies
apt-get install -qqy shellcheck > /dev/null;
gem install rubocop -- --silent > /dev/null;
# install nginx for validating configs only, stop service and disable autostart
apt-get install -qqy nginx  > /dev/null && \
  sudo service nginx stop > /dev/null && \
  sudo update-rc.d -f nginx disable > /dev/null;
# install node + npm for standard linting
curl -sSL https://deb.nodesource.com/setup_5.x | sudo -E bash - > /dev/null && \
  apt-get update -qq > /dev/null &&
  apt-get install -qqy --no-install-recommends nodejs > /dev/null &&
  npm install -qqg standard > /dev/null;
