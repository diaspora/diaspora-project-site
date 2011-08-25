class AddKindToContributors < ActiveRecord::Migration
  def self.up
    add_column :contributors, :kind, :string
  end

  def self.down
    remove_column :contributors, :kind
  end
end
