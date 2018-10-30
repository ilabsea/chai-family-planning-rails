# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "chai-family-planning"
set :branch, :authentication
set :repo_url, "https://github.com/ilabsea/chai-family-planning-rails.git"

set :rbenv_ruby, File.read('.ruby-version').strip

set :deploy_user, 'ilab'

# Default value for :linked_files is []
append :linked_files, 'config/database.yml', 'config/secrets.yml', 'config/application.yml'

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"


set :passenger_restart_with_touch, true

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
