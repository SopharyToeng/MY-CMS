source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails',              '~> 5.0.0'
gem 'pg',                 '~> 0.20.0'
gem 'puma',               '~> 3.0'
gem 'sass-rails',         '~> 5.0'
gem 'uglifier',           '>= 1.3.0'
gem 'coffee-rails',       '~> 4.2'
gem 'jquery-rails',       '~> 4.2', '>= 4.2.2'
gem 'turbolinks',         '~> 5'
gem 'jbuilder',           '~> 2.5'
gem 'dotenv-rails',       '~> 2.2'
gem 'haml',               '~> 4.0', '>= 4.0.7'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.1'
gem 'bootstrap-sass',     '~> 3.3', '>= 3.3.7'
gem 'bourbon',            '~> 4.3', '>= 4.3.3'
gem 'camaleon_cms',       '~> 2.4', '>= 2.4.3'

gem 'activemodel-serializers-xml', git: 'https://github.com/rails/activemodel-serializers-xml'
gem 'draper', github: 'audionerd/draper', branch: 'rails5'

gem 'paper_trail',        '~> 6.0', '>= 6.0.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'pry'
end

group :development do
  gem 'web-console',           '>= 3.3.0'
  gem 'listen',                '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'capistrano-rails',      '~> 1.2', '>= 1.2.3'
  gem 'capistrano-passenger',  '~> 0.2.0'
  gem 'capistrano-rvm',        '~> 0.1.2'
end

group :production, :staging do
  gem 'appsignal',  '~> 2.1', '>= 2.1.1'
  gem 'asset_sync', '~> 2.0'
  gem 'fog-aws',    '~> 1.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


#################### Camaleon CMS include all gems for plugins and themes ####################
require './lib/plugin_routes'
instance_eval(PluginRoutes.draw_gems)
