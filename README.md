# base-box

My old Vagrant base box back from ~2015ish, stored here for archival purposes.

Vaguely around 2015, I used Vagrant quite heavily for cross-platform development environments supporting dev teams on Linux, macOS (OS X at the time), and Windows.
By having a standardized, virtualized dev env, my teams could reliably reproduce anything in any language and use a consistent OS for everything (Ubuntu 14.04 at the time).

I used Vagrant before Docker but even with Docker, there was still some difficulty in installing it cross-platform at the time as well as getting networking and filesystems configured consistently.
This base box helped standardize the usage and configuration of Docker later on.
This was also well before [devcontainers](https://github.com/devcontainers/spec), so the rest of the VM was also useful to install and configure other dev tools surrounding each service's container, such as:

- [`vagrant-fsnotify`](https://github.com/adrienkohlbecker/vagrant-fsnotify) for cross-platform FS notifications to be able to watch filesystems
- [`sman`](https://github.com/tokozedg/sman) for organizing and running collections of scripts
- Git hooks with [`overcommit`](https://github.com/sds/overcommit), Git defaults, etc
- Language runtimes and package managers like Python + `pip`, Node.js + NPM, Ruby, etc
- Static analyzers and linting tools like [`shellcheck`](https://github.com/koalaman/shellcheck), [`rubocop`](https://github.com/rubocop/rubocop), [`flake8`](https://github.com/PyCQA/flake8), [`standard`](https://github.com/standard/standard) [`mdl`](https://github.com/markdownlint/markdownlint), etc
- Deployment tools like the AWS CLI, Terraform, etc

I used variations of this base box in my work for [LTLMoPWeb3D](https://github.com/VerifiableRobotics/LTLMoPWeb3D) ([Vagrantfile permalink](https://github.com/VerifiableRobotics/LTLMoPWeb3D/blob/c6479b51cb147f58ec2e30aeae4aa56aba18d5a6/Vagrantfile), [initial usage](https://github.com/VerifiableRobotics/LTLMoPWeb3D/commit/3ee4645aa0d0c2778253bf73ba633db8caac3f09)), [PDFSign.js](https://github.com/agilgur5/PDFSign.js), [Yorango](https://github.com/Yorango), [Maidbot](maidbot.com), etc.

Below is what the rest of the initial README for the dev env would usually contain.

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
