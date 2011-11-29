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
