module Planet
  module Models
    class Entry < ActiveRecord::Base
      belongs_to :feed
      validates_presence_of :entry_id, :feed, :title, :body, :url
      validates_uniqueness_of :entry_id
    end
  end
end
