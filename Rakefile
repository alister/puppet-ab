require 'rubygems'

# #https://github.com/rodjek/puppet-lint -- 'rake lint'
require 'puppet-lint/tasks/puppet-lint'
PuppetLint.configuration.send("disable_80chars")
PuppetLint.configuration.log_format = "%{path}:\t%{linenumber}: %{check} (%{KIND}): %{message}"

PUPPETMASTER = 'cookbook'
SSH = 'ssh -t -A'

# SSH to the puppet master, and git pull the puppet manifests
task :deploy do
    sh "git push"
    sh "#{SSH} #{PUPPETMASTER} 'cd /etc/puppet && sudo git pull'"
end

# use:    rake CLIENT=hostname.example.com apply
# Deploys first, then run the rest
task :apply => [:deploy] do
    client = ENV['CLIENT']
    sh "#{SSH} #{client} 'sudo puppet agent --test'" do |ok, status|
        puts case status.exitstatus
            when 0 then "Client is up to date."
            when 1 then "Puppet couldn't compile the manifest."
            when 2 then "Puppet made changes."
            when 4 then "Puppet found errors."
        end
    end
end

# If you want to see what changes Puppet would make, without actually changing 
# anything, use the --noop fag:
#
#     rake CLIENT=hostname.example.com  noop
#
# This will show you a preview of the changes.
task :noop => [:deploy] do
    client = ENV['CLIENT']
    sh "#{SSH} #{client} 'sudo puppet agent --test --noop'"
end

task :docs do
    sh "puppet doc --all --outputdir=/var/www/puppet --mode rdoc \
                 --manifestdir=/etc/puppet/manifests/"
end

# make .png's of the --graph. 
# @todo replace `hostname` with ENV[SERVER], defaulting to `hostname`
task :graphs do
    sh "puppet agent --test --graph --server=`hostname`"
    sh "dot -Tpng -o /var/www/puppet/resources.png              /var/lib/puppet/state/graphs/resources.dot"
    sh "dot -Tpng -o /var/www/puppet/relationships.png          /var/lib/puppet/state/graphs/relationships.dot"
    sh "dot -Tpng -o /var/www/puppet/expanded_relationships.png /var/lib/puppet/state/graphs/expanded_relationships.dot"
end

# A simple Rake task to delete backup files
task :clean do
    Dir['*~','**/*~'].each {|fn| rm fn rescue nil}
end
