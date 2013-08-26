class Blogpost < ActiveRecord::Base
  def to_param
    "#{self.id}-#{self.title}".parameterize
  end
end
