after "deploy:update", "bundler:new_release"

namespace :bundler do
  task :setup, :roles => :app do
    run "mkdir -p #{shared_path}/.bundle"
    run "gem install bundler"
  end
  
  task :new_release, :roles => :app do
    run "cd #{current_path} && bundle install --path vendor/bundler_gems"
  end
end