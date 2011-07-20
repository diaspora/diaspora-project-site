class CreateContributors < ActiveRecord::Migration
  def self.up
    create_table :contributors do |t|
      t.string :name
      t.string :github_username
      t.string :diaspora_id
      t.text :bio
      t.string :avatar

      t.timestamps
    end
  end

  def self.down
    drop_table :contributors
  end
end
