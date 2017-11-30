source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.1'
gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'toastr-rails'
gem 'devise'
gem 'remotipart', github: 'mshibuya/remotipart'
gem 'rails_admin'
gem 'groupdate'
gem 'chartkick'
gem 'font-awesome-rails'
gem 'bootstrap', '~> 4.0.0.beta2.1'
gem 'jquery-rails'
#gem 'google-api-client', :require => 'google/api_client'
gem 'google-api-client'
gem 'ruby-gmail'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'figaro'
gem "simple_calendar", "~> 2.0"

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'rails_12factor', group: :production

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :test do
  gem 'cucumber-rails', :require => false
# database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'rspec-rails'
end

gem 'simplecov', :require => false, :group => :test

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-rbenv', '~> 2.0'
  gem 'capistrano-rbenv-install', '~> 1.2.0'
  gem 'capistrano-passenger'
  gem 'capistrano-secrets-yml', '~> 1.0.0'
  gem 'capistrano-shell'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
