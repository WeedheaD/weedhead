require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'
require 'mina/puma'
require 'mina/multistage'
require 'mina_sidekiq/tasks'
 
set :application_name, 'weedhead'
set :repository, 'https://github.com/WeedheaD/weedhead.git'
set :rvm_use_path, '/usr/local/rvm/scripts/rvm'
 
#shared dirs and files will be symlinked into the app-folder by the 'deploy:link_shared_paths' step.
set :shared_dirs, fetch(:shared_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/uploads')
set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/secrets.yml', 'config/puma.rb')
 
#This task is the environment that is loaded for all remote run commands, such as
#`mina deploy` or `mina rake`.
#Set ruby version. If you have RVM installed globally, you’ll also need to set an RVM path, 
#like: set :rvm_use_path, '/usr/local/rvm/scripts/rvm'.
#You can find the RVM location with the rvm info command.
 
task :environment do
    invoke :'rvm:use', 'ruby-2.4.0@default'
end
 
#Put any custom commands you need to run at setup
#All paths in `shared_dirs` and `shared_paths` will be created on their own.
task :setup do
    #sidekiq needs a place to store its pid file and log file
    command %(mkdir -p "#{fetch(:deploy_to)}/shared/pids/")
    command %(mkdir -p "#{fetch(:deploy_to)}/shared/log/")
    command %[touch "#{fetch(:shared_path)}/config/database.yml"] 
    command %[touch "#{fetch(:shared_path)}/config/secrets.yml"]
    command %[touch "#{fetch(:shared_path)}/config/puma.rb"]
    comment "Be sure to edit '#{fetch(:shared_path)}/config/database.yml', 'secrets.yml' and puma.rb."
end
 
desc "Deploys the current version to the server."
task :deploy do
     #uncomment this line to make sure you pushed your local branch to the remote origin
    #invoke :'git:ensure_pushed'
    deploy do
        # Put things that will set up an empty directory into a fully set-up
        #instance of your project.
        #invoke :'sidekiq:quiet' # remove this for first deploy
        invoke :'git:clone'
        invoke :'deploy:link_shared_paths'
        invoke :'bundle:install'
        invoke :'rails:db_migrate'
        invoke :'rails:assets_precompile'
        invoke :'deploy:cleanup'
        on :launch do
            in_path(fetch(:current_path)) do
                command %{mkdir -p tmp/}
                command %{touch tmp/restart.txt}
            end
            invoke :'sidekiq:start' # use this for first deploy
            invoke :'puma:start' # use this for first deploy
        end
    end
end
