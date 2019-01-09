source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6', '>= 5.1.6.1'

gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'mini_racer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'kaminari'


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'rspec-rails'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'annotate', '~> 2.7.2'

  gem 'capistrano', '~> 3.10', require: false
  gem 'capistrano-rails',       '~> 1.3.1', require: false
  gem 'capistrano-rbenv',       '~> 2.1.3'
  gem 'capistrano-bundler',     '~> 1.3.0'
  gem 'capistrano-passenger',   '~> 0.2.0'
end

group :test do
  gem 'factory_bot_rails', '~> 4.8.2'
  gem 'shoulda-matchers',       '~> 3.1.2'
  gem 'database_cleaner',       '~> 1.6.2'
  gem 'ffaker',                 '~> 2.8.0'
end

gem 'devise', '~>4.4.1'
gem 'active_model_serializers', '~> 0.9.7'
gem 'bootstrap'
