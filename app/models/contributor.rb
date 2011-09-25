class Contributor < ActiveRecord::Base
  def github_url
    "https://github.com/#{self.github_username}"
  end

  def first_name
    self.name.split(' ').first
  end

  def diaspora_username
   diaspora_id.split('@').first
  end

  def diaspora_url
    username, server = diaspora_id.split('@')
    "http://#{server}/u/#{username}"
  end


  def diaspora_avatar
    "#{diaspora_url}/profile_photo"
  end
end
