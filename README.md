# base-box
My old Vagrant base box back from ~2015ish, stored here for archival purposes

## Installation

1. `git clone` this repository
2. Install [Vagrant](https://www.vagrantup.com/downloads.html)
3. From the root directory of the repository, create a VM with `vagrant up`.
   This may take several minutes as this command does quite a few things:
   - Installs VirtualBox if you do not have it already
     - This will **ask for your root password**, so be prepared to type it in
   - Configures networking, memory, and shared folders for the virtual machine (see [Vagrantfile](Vagrantfile))
   - Runs a [provisioning script](provision.sh) to install several pieces of necessary software on the VM
   - [Runs all services](run_services.sh) for back end and front end, building them if they have not yet been created
4. Connect to <http://12.12.12.12>

## Using the Environment

1. Launch a secure shell into the VM with `vagrant ssh`
2. Change directories into the the shared folder (`cd /vagrant`)
3. Use `git` as you normally would, just from _inside_ the environment

## Further Reading

1. [Vagrant Docs](https://docs.vagrantup.com/)
2. [Docker Docs](https://docs.docker.com/)
    - Read the Engine and Compose CLIs
