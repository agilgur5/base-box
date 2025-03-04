# -*- mode: ruby -*-
# vi: set ft=ruby :

# install any plugins required to run this VM properly
required_plugins = %w(vagrant-fsnotify)
required_plugins.each do |plugin|
  unless (Vagrant.has_plugin? plugin) || ARGV[0] == 'plugin'
    exec "vagrant plugin install #{plugin};vagrant #{ARGV.join(' ')}"
  end
end

Vagrant.configure(2) do |config|
  config.vm.box = 'phusion/ubuntu-14.04-amd64'

  # create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network 'private_network', ip: '192.168.33.10'

  # customize VirtualBox provider
  config.vm.provider 'virtualbox' do |vb|
    vb.memory = '1024'
  end

  # sync the codebase to /vagrant
  # VFS by default, NFS if available
  config.vm.synced_folder './', '/vagrant', fsnotify: true
  config.vm.synced_folder './', '/vagrant', type: 'nfs', fsnotify: true

  # provision the image
  config.vm.provision 'shell',
    path: 'provision.sh',
    name: 'provision'
  # set version control standards
  config.vm.provision 'shell',
    path: 'committing/standards.sh',
    name: 'version_control',
    privileged: false # run as vagrant user, not root
  # install + set version control hooks
  config.vm.provision 'shell',
    path: 'committing/install_hooks.sh',
    name: 'hooks'

  # only run the initialization on the first 'vagrant up'
  # pass environment variables to these provisioners
  if Dir.glob(File.dirname(__FILE__) + '/.vagrant/machines/default/*/id').empty?
    #
    # example below:
    # set version control default preferences
    # config.vm.provision 'shell',
    #   path: 'committing/preferences.sh',
    #   privileged: false,
    #   env: {
    #     GITLAB_EMAIL: ENV['GITLAB_EMAIL'],
    #     GITLAB_USERNAME: ENV['GITLAB_USERNAME']
    #   }
    # decrypt secrets
    # config.vm.provision 'shell',
    #   path: 'init/decrypt_files.sh',
    #   name: 'decrypt',
    #   env: { DECRYPT_PASSWORD: ENV['DECRYPT_PASSWORD'] }
    #
  end

  #
  # example below:
  # run all services on every vagrant up / reload
  # config.vm.provision 'shell',
  #   path: 'services/run_services.sh',
  #   name: 'services',
  #   run: 'always'
  #
end
