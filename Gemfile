source "https://rubygems.org"

gem "rails",                  "4.2.10"

gem "puma",                   "3.12.0"

group :mysql, optional: true do
  gem "mysql2", "0.4.4"
end
group :postgresql, optional: true do
  gem "pg",     "0.19.0"
end

gem "devise",                 "4.1.1"
gem "rails_admin"

gem "rails_locale_detection", "2.0.0"

gem "sass-rails",             "5.0.4"
gem "bootstrap-sass",         "3.3.6"
gem "uglifier",               "3.0.0"
gem "coffee-rails",           "4.1.1"
gem "jquery-rails",           "4.1.1"
gem "turbolinks"
gem "will_paginate-bootstrap"

gem "redcarpet",              "3.3.4"
gem "paperclip",              "4.3.6"

gem "feedjira",               github: "feedjira/feedjira"
gem "trollop",                "2.1.2"
gem "sanitize",               "4.0.1"

group :development, :test do
  gem "pry"
  gem "awesome_print",   "1.7.0"

  gem "rspec-rails",     "3.4.2"
  gem "capybara",        "2.7.1"

  gem "fuubar",          "2.0.0"
  gem "rspec-instafail", "1.0.0"
end

group :development do
  gem "web_translate_it"
end
