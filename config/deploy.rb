require 'bundler/capistrano'
load 'config/deploy/rvm'

set :application, "Forum"
set :repository,  "git@github.com:gerard-leijdekkers/forum.git"

set :use_sudo, false
set :group_writable, false

set :scm, :git

role :web, "venus.i76.nl"                          # Your HTTP server, Apache/etc
role :app, "venus.i76.nl"                          # This may be the same as your `Web` server
role :db,  "venus.i76.nl", :primary => true # This is where Rails migrations will run

set :deploy_to, "/home/forum"
set :user,      "forum"
set :password,  "chatty"
set :rails_env, "production"
set :branch,    "master"

set :deploy_via, :remote_cache
