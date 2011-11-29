PUPPETMASTER = 'cookbook'
SSH = 'ssh -t -A'

# SSH to the puppet master, and git pull the puppet manifests
task :deploy do
    sh "git push"
    sh "#{SSH} #{PUPPETMASTER} 'cd /etc/puppet && sudo git pull'"
end
