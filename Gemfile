source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 6.1.4'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'ridgepole'
gem 'faraday'
gem 'activerecord-import'
gem 'graphql'
gem 'mini_racer', platforms: :ruby

group :development, :test do
  gem 'graphiql-rails'
  gem 'rspec-rails'
  gem 'pry-byebug'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-performance', require: false
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'capistrano'
  gem 'capistrano'
  gem 'ed25519'
  gem 'bcrypt_pbkdf'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano3-puma'
  gem 'capistrano-nginx'
  gem 'capistrano-yarn'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
