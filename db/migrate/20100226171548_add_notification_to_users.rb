class AddNotificationToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :notified, :boolean
  end

  def self.down
    remove_column :users, :notified
  end
end
