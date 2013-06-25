class CreateBlogposts < ActiveRecord::Migration
  def change
    create_table(:blogposts) do |t|
      t.string :title, :null => false
      t.boolean :published, :default => false
      t.text :content, :null => false

      t.timestamps
    end
  end
end
