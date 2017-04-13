# The diaspora\* Project Site

[![Join the chat at https://gitter.im/diaspora/diaspora-project-site](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/diaspora/diaspora-project-site?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[![Dependency Status](https://gemnasium.com/diaspora/diaspora-project-site.png)](https://gemnasium.com/diaspora/diaspora-project-site)

This is the repository of the official diaspora\* project site hosted on [diasporafoundation.org](https://diasporafoundation.org/).

## Installation

If you want to contribute, you may need to install this application on your development machine. This is a very basic installation guide, assuming you know Rails.

1. Install Ruby 2.1. It doesn't matter if you're using RVM, rbenv or anything else.
2. Check out the source with `git clone https://github.com/diaspora/diaspora-project-site.git` and `cd` into it.
3. Install the bundler gem: `gem install bundler`.
4. Install all the dependencies: `bundle install --with mysql`.
5. Copy `config/database.yml.example` to `config/database.yml` and add your database credentials.
6. Set your secret token with `export SECRET_TOKEN=*******`
7. Create your database and the required tables with `rake db:setup`.
8. Start puma with `bundle exec puma`.
9. You can now access the website at localhost:9292
