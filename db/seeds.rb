# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Page.create(title: 'Home', content: 'home', published: true, url: 'home')

[['Diaspora blog', 'http://blog.diasporafoundation.org/feed/atom']].each do |title, url|
  Planet::Models::Feed.create! title: title, url: url
end
