source 'https://rubygems.org'

ruby '2.2.2'

gem 'omniauth', '~> 1.8.1'
gem 'omniauth-oauth2', '~> 1.3.1'
gem 'omniauth-reddit', :git => 'https://github.com/jackdempsey/omniauth-reddit.git', :ref => '47d8d310f144c084fb373db282f6a4aa5f48847f'

# For rake pet_requests:import only; don't have the whole app require it
gem 'redd', '~> 0.7.0', require: false

gem 'bootstrap-sass', '~> 3.3.4'

gem 'rails-timeago', '~> 2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.1.4'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.3.1'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

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

  # It's surprisingly important to gzip our application responses! In practice,
  # our index page gets huge, but mostly with redundant HTML structure - at
  # time of writing, the index page is 292K uncompressed, and 26K compressed.
  gem 'heroku-deflater'
end
