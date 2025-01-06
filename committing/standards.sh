echo 'Configuring Git...';
# must have settings to be used by all developers
git config --global core.autocrlf input; # line endings
git config --global pull.rebase true; # rebase pull
git config --global core.whitespace tab_in_indent # mark tabs red

# default template for commit messages -- must be absolute path
# git config --global commit.template /vagrant/committing/template.txt;
