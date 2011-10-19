after "deploy:update", "symlinks:make"

set :normal_symlinks, %w(
  config/database.yml
  tmp
  log
)

namespace :symlinks do
  desc "Make all the symlinks in one go"
  task :make, :roles => :app, :except => { :no_release => true } do
    commands = normal_symlinks.map do |path|
      "rm -rf #{current_path}/#{path} && \
       ln -s #{shared_path}/#{path} #{current_path}/#{path}"
    end
    
    run <<-CMD
      cd #{current_path} &&
      #{commands.join(" && ")}
    CMD
  end
end