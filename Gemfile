source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'devise'
gem 'devise-i18n'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.3'
gem 'rails-i18n'
gem 'twitter-bootstrap-rails'
gem 'webpacker', '~> 4.0'
gem 'pundit'
gem 'carrierwave'
gem 'rmagick', '~> 4.1.2'
gem 'fog-aws'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'listen', '~> 3.2'
  gem 'sqlite3', '~> 1.4'
  gem 'letter_opener'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'

  gem 'capistrano', '~> 3.14.1'
  gem 'capistrano-rails', '~> 1.6.1'
  gem 'capistrano-passenger', '~> 0.2'
  gem 'capistrano-rbenv', '~> 2.2'
  gem 'capistrano-bundler', '~> 2.0.1'
    #gem 'capistrano-resque', '~> 0.2.3', require: false
end

group :production do
  gem 'pg', '~>1.2.3'
end

