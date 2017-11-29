#lock '3.9.1'

set :application, 'project'
set :repo_url, 'git@vgl-ait.org:web17-04'
set :deploy_to, '/home/deploy/project'
set :repo_tree, 'project'
require "capistrano/scm/git"
set :scm, :git
append :linked_files, 'config/database.yml', 'config/secrets.yml'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'
set :rbenv_ruby, '2.4.1'
set :keep_releases, 5
set :passenger_restart_with_touch, true

set :default_env, {
    'https_proxy' => '192.41.170.23:3128',
    'http_proxy' => '192.41.170.23:3128',
}
