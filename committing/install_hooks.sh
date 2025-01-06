#!/bin/bash
# bash is necessary for pushd/popd
pushd /vagrant;
# disable shellcheck's tilde check for all version tildes

echo 'Installing Git Hooks...';
# install overcommit
apt-get install -qqy ruby-full > /dev/null;
# shellcheck disable=SC2088
gem install overcommit -v '~> 0.34.2' -- --silent > /dev/null;

# hook dependencies
apt-get install -qqy shellcheck > /dev/null;
# shellcheck disable=SC2088
gem install rubocop -v '~> 0.41.2' -- --silent > /dev/null;
# shellcheck disable=SC2088
gem install mdl -v '~> 0.3.1' -- --silent > /dev/null;
# shellcheck disable=SC2088
pip -q install 'flake8~=3.0.3' > /dev/null;
# install node + npm + babel-eslint + standard for JS linting
curl -sSL https://deb.nodesource.com/setup_6.x | sudo -E bash - > /dev/null && \
  apt-get update -qq > /dev/null &&
  apt-get install -qqy --no-install-recommends nodejs > /dev/null &&
  npm install -qqg standard@'^7.1.2' babel-eslint@'^6.1.0' > /dev/null;
# install nginx for validating configs only, stop service and disable autostart
apt-get install -qqy nginx  > /dev/null && \
  sudo service nginx stop > /dev/null && \
  sudo update-rc.d -f nginx disable > /dev/null;

# install and sign the hooks themselves
# example below:
# overcommit --install;
# overcommit --sign;

popd;
