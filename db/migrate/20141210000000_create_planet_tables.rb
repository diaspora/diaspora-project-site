class CreatePlanetTables < ActiveRecord::Migration
  def change
    create_table :planet_feeds do |t|
      t.string :url, limit: 800
      t.string :site_url, limit: 800
      t.string :title
      t.timestamps
    end

    create_table :planet_entries do |t|
      t.string :title
      t.string :author
      t.string :url, limit: 800
      t.string :entry_id, limit: 800
      t.text :body
      t.datetime :published_at
      t.references :feed
      t.timestamps
    end
  end
end
