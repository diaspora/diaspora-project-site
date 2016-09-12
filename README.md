# The diaspora\* Project Site

[![Dependency Status](https://gemnasium.com/diaspora/diaspora-project-site.png)](https://gemnasium.com/diaspora/diaspora-project-site)

This is the repository of the official diaspora\* project site hosted on [diasporafoundation.org](https://diasporafoundation.org/).

## Installation

If you want to contribute, you may need to install this application on your development machine. This is a very basic installation guide, assuming you know Rails.

1. Install Ruby 2.1. It doesn't matter if you're using RVM, rbenv or anything else.
2. Check out the source with `git clone https://github.com/diaspora/diaspora-project-site.git` and `cd` into it.
3. Install the bundler gem: `gem install bundler`.
4. Install all the dependencies: `bundle install`.
5. Copy `config/database.yml.example` to `config/database.yml` and add your database credentials.
6. Set your secret token with `export SECRET_TOKEN=*******`
7. Create your database and the required tables with `rake db:setup`.
8. Start puma with `bundle exec puma`.
9. You can now access the website at localhost:9292
