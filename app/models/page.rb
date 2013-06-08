class Page < ActiveRecord::Base
  attr_accessible :content, :published, :title, :url

  def self.to_param
    "#{self.title.parameterize}"
  end
end
