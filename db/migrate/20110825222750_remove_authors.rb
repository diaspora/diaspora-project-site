class RemoveAuthors < ActiveRecord::Migration
  def self.up
    drop_table :authors
  end

  def self.down
  end
end
