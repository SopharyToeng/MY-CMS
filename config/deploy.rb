# config valid only for current version of Capistrano
lock "3.8.0"

set :application, "ccca"
set :repo_url, "git@github.com-#{fetch(:application)}:rotati/#{fetch(:application)}.git"

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache',
'tmp/sockets', 'public/media')
set :linked_files, fetch(:linked_files, []).push('.env')

set :scm, :git

set :pty, true

set :keep_releases, 5

set :assets_prefix, ->{ "#{fetch(:application)}/assets" }

namespace :deploy do

  task :cleanup_assets do
    on roles :all do
      execute "cd #{release_path}/ && ~/.rvm/bin/rvm default do bundle exec rake assets:clobber RAILS_ENV=#{fetch(:stage)}"
    end
  end

  before :updated, :cleanup_assets
end
