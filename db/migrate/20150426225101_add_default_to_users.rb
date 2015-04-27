class AddDefaultToUsers < ActiveRecord::Migration
  def self.up
    add_attachment :users, :default_logo
    add_column :users, :default_address, :text
  end

  def self.down
    remove_attachment :users, :default_logo
    remove_column :users, :default_address, :text
  end
end
