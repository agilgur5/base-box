# Services

This is an example directory that could contain a Compose file, directories for each service, and a README giving an overview of the services in this project and how to use them.

## Table of Contents

I. [Development](#development) <br />
II. [Back End Development](core/) <br />
III. [Front End Development](static/) <br />
IV. [Deployment](deploy/) <br />
V. [Further Reading](#further-reading)

## Development

1. `vagrant up` to start the already created and provisioned VM
    - By default, this starts all services automatically
1. Connect to <http://192.168.33.10>

### Using the Environment

From _this_ directory,

1. `docker-compose up -d` will run the services
1. `docker-compose logs` will show the output of the services

## Further Reading

1. [Docker Docs](https://docs.docker.com/)
    - Read the Engine and Compose CLIs
