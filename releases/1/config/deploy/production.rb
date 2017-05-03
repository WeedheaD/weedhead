et :domain, '51.15.71.20' 
set :deploy_to, '/var/ruby/weedhead'
set :user, 'weedhead'  #Username of ssh user for access to the remote server.
set :roles, %w{app db web}
set :rails_env, 'production'
set :branch, 'master'
