class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :title
      t.boolean :public
      t.text :description
      t.text :copyright
      t.attachment :file

      t.timestamps
    end
  end
end
