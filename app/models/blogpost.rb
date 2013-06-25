class Blogpost < ActiveRecord::Base
  attr_accessible :title, :published, :content
end
