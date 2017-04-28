#this is for production environment
#change the environment to "staging" for staging environment
environment "production"
bind  "unix:///var/ruby/weedhead/shared/tmp/sockets/puma.sock"
pidfile "/var/ruby/weedhead/shared/tmp/pids/puma.pid"
state_path "/var/ruby/weedhead/shared/tmp/sockets/puma.state"
directory "/var/ruby/weedhead/current"
workers 2
threads 1,2
daemonize true
activate_control_app 'unix:///var/ruby/weedhead/shared/tmp/sockets/pumactl.sock'
prune_bundler
