#!/bin/bash
# bash is necessary for pushd/popd

echo 'Running all services...';
pushd /vagrant; # store initial location to later return to
docker-compose up -d;

# return to initial location
popd;
