source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.1.6"
gem "bootstrap-sass", "3.3.7"
gem "puma", "~> 3.7"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "rubocop", "~> 0.49.1", require: false
gem "bcrypt", "3.1.12"
gem "config"
gem "jquery-rails", "4.3.1"
gem "faker"
gem "will_paginate", "3.1.6"
gem "bootstrap-will_paginate", "1.0.0"
gem "figaro"
gem "carrierwave", "1.2.2"
gem "mini_magick", "4.7.0"
gem "momentjs-rails", ">= 2.9.0"
gem "bootstrap3-datetimepicker-rails", "~> 4.17.47"
gem "i18n-js"

group :production do
  gem "pg", "0.20.0"
  gem "fog", "1.42"
end

group :development, :test do
  gem "sqlite3"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
  gem "pry-rails"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end
