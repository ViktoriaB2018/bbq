source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'
gem 'rails', '~> 5.2.2'
gem 'puma', '~> 3.11'
gem 'uglifier', '>= 1.3.0'
gem 'sass-rails'
gem 'coffee-rails'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'twitter-bootstrap-rails'
gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n'
gem 'jquery-rails', '~> 4.1'
gem 'carrierwave'
gem 'rmagick', '~> 3.0.0'
gem 'fog-aws'
gem 'figaro'
gem 'lightbox-bootstrap-rails', '~> 5.1', '>= 5.1.0.1'
gem 'pundit', '~> 2.0', '>= 2.0.1'

group :development, :test do
  gem 'sqlite3', '~> 1.3.6'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.4'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'letter_opener'
  gem 'capistrano', '~> 3.11', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-passenger', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano-bundler', require: false
end

group :production do
  gem 'pg', '~> 1.1.4'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
