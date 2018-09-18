source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}
ruby "2.5.1"
gem "bcrypt"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap-sass", "3.3.7"
gem "bootstrap-will_paginate", "1.0.0"
gem "carrierwave"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "faker"
gem "jbuilder", "~> 2.5"
gem "jquery-rails", "~> 4.3", ">= 4.3.3"
gem "mailgun-ruby", "~>1.0.2", require: "mailgun"
gem "mini_magick"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.1"
gem "rails-i18n"
gem "rails-ujs"
gem "sass-rails", "~> 5.0"
gem "sqlite3"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "will_paginate", "3.1.6"
group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rubocop", "~> 0.54.0", require: false
end

group :development do
  gem "fog"
  gem "fog-aws"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
group :production do
  gem "pg", "0.18.4"
end
