# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/www.bedwars.network/staging/'

namespace :deploy do
  after :remove, :start
  task :start do
    on roles(:app) do      
      # modify this to suit how you want to run your app
      execute "docker run -d -p 127.0.0.1:#{ENV['DEPLOY_LISTEN_PORT_STAGING']}:80 --restart=always --name=#{fetch(:application)}.staging #{fetch(:application)}"
    end
  end
end
