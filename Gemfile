source 'https://rubygems.org'

ruby '3.1.2'

gem 'omniauth', '~> 1.8.1'
gem 'omniauth-oauth2', '~> 1.3.1'
gem 'omniauth-reddit', :git => 'https://github.com/jackdempsey/omniauth-reddit.git', :ref => '47d8d310f144c084fb373db282f6a4aa5f48847f'

# For rake pet_requests:import only; don't have the whole app require it
gem 'redd', '~> 0.7.0', require: false

gem 'bootstrap-sass', '~> 3.4.1'

gem 'rails-timeago', '~> 2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '7.0.3.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 5.0.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'mini_racer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.3.1'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Puma is the web server that Rails runs behind!
gem 'puma', '~> 5.6', '>= 5.6.5'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # TODO: should probs use the same database everywhere xP
  gem 'sqlite3'

  # Store your development Reddit secrets here :)
  gem 'dotenv-rails'
end

group :production do
  # TODO: should probs use the same database everywhere xP
  gem 'pg'
end
