#!/bin/bash
# bash is necessary for pushd/popd

#
# this is an example script you might run when starting the VM
#

# as this file is copied and run from /tmp, can't use $(dirname "$0")
pushd /vagrant/services;

echo 'Running all services...';
docker-compose up -d;

popd;
