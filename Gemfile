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
gem 'carrierwave'
gem 'rmagick', '~> 4.1.2'
gem 'fog-aws'

group :development do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'listen', '~> 3.2'
  gem 'sqlite3', '~> 1.4'
  gem 'letter_opener'
end

group :production do
  gem 'pg', '~>1.2.3'
end

