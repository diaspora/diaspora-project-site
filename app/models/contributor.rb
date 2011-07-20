class Contributor < ActiveRecord::Base
  def github_url
    "https://github.com/#{self.github_username}"
  end

  def first_name
    self.name.split(' ').first
  end
end
