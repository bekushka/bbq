# config valid for current version and patch releases of Capistrano
lock "~> 3.14.1"

Rake::Task["deploy:assets:backup_manifest"].clear_actions

set :application, "party-hub"
set :repo_url, "git@github.com:bekushka/bbq.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :branch, :main

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deploy/www/party-hub"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml.example", "config/database.yml", "config/secrets.yml.example", "config/secrets.yml", ".env", "config/master.key"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundler", "public/system", "public/uploads"

after "deploy:restart", "resque:restart"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
