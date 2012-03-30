## Installing Git/Puppet and bring up a Puppet-ised machine

# get the basics
sudo apt-get install git-core puppet

# get the SSH key (eg, from a USB stick in media/*/)
cp /media/*/ssh/amvdev-remote.* ~/.ssh/
cd ~/.ssh/
ln -s amvdev-remote.openssh.key id_rsa
chmod 600 *
cd ~

# check out the puppet repo
git clone git@github.com:alister/puppet-ab.git

# edit manifests/node.pp to add a section based on `hostname`
# ....

# Run Puppet
clear;./update.sh 
# aka: puppet  apply --modulepath=modules --onetime -v --no-daemonize --debug modules/site.pp 

## Other tools:
* guard - watch the .pp files and run puppet-lint when they change
