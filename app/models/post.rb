class Post < ActiveRecord::Base
  belongs_to :author

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
