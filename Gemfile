source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 6.0.1'
gem 'mysql2', '>= 0.4.4'
gem 'webpacker', '~> 4.0'
gem 'jbuilder', '~> 2.7'
# Use Active Storage variant
gem 'image_processing', '~> 1.12'
gem 'bootsnap', '>= 1.4.2', require: false

gem 'mini_magick'
gem 'pretender'
gem 'pundit'

gem "prawn"

gem 'simple_form', '~> 5'
gem 'devise'
gem "recaptcha"
# gem "recaptcha", require: "recaptcha/rails"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
