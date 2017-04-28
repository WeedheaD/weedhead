set :domain, '51.15.71.20'
set :deploy_to, '/var/ruby/weedhead_staging'
set :user, 'weedhead'  #Username of ssh user for access to the remote server.
set :port, '22'
set :roles, %w{web app db}
set :rails_env, 'staging'
set :branch, 'weedhead_staging_branch'
