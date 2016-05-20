namespace :apache do
  desc 'Reload apache (requires root access to apache reload)'
  task :reload do
    on release_roles(fetch(:apache_roles)) do
      execute :apache, 'reload'
    end
  end

  desc 'Force reload apache (requires root access to apache reload)'
  task :force_reload do
    on release_roles(fetch(:apache_roles)) do
      execute :apache, 'force-reload'
    end
  end

  desc 'Stop apache (requires root access to apache stop)'
  task :stop do
    on release_roles(fetch(:apache_roles)) do
      execute :apache, 'stop'
    end
  end

  desc 'Start apache (requires root access to apache start)'
  task :start do
    on release_roles(fetch(:apache_roles)) do
      execute :apache, 'start'
    end
  end

  desc 'Restart apache (requires root access to apache restart)'
  task :restart do
    on release_roles(fetch(:apache_roles)) do
      execute :apache, 'restart'
    end
  end
end

namespace :load do
  task :defaults do
    set :apache_roles, :all
  end
end

SSHKit.config.command_map[:apache] = 'sudo /etc/init.d/apache2'
