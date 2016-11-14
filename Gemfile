source 'http://rubygems.org'
ruby "2.2.5"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'bootstrap-datepicker-rails'

#downgrade b/c current version requires ruby 2.2.5
# gem 'ruby_dep', '~> 1.3.1'
# gem 'listen', '~> 3.0.8'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# for sass
gem 'bourbon'

# for Authentication
gem 'devise'

# for Authorization
gem 'cancancan', '~> 1.10'

# for User roles
gem "rolify" 

# pdf generation
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

#for change tracking
gem 'paper_trail'

#to build breadcrumbs
gem "breadcrumbs_on_rails"

# Mail server
gem 'mailgun-ruby', '~>1.0.0'

# Controller specific javascript
gem 'paloma', '~> 5.0.0'


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  gem 'sqlite3'
end
group :production do
  gem 'pg'
  gem 'puma'
  gem 'rails_12factor'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'dotenv-rails'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'better_errors'

  gem 'quiet_assets'

  # optimization
  gem 'bullet'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'capybara'
  gem 'guard-rspec'
  gem 'launchy'
end
