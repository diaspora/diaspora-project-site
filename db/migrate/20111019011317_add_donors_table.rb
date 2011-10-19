class AddDonorsTable < ActiveRecord::Migration
  def self.up
    create_table :donors do |d|
      d.column :name, :string
      d.column :email, :string
      d.column :stripe_token, :string, :null => false
    end
  end

  def self.down
    drop_table :donors
  end
end
