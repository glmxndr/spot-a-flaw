class CreateFlags < ActiveRecord::Migration
  def self.up
    create_table :flags do |t|
      t.integer :user_id
      t.integer :fallacy_id
      t.integer :topic_id
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :flags
  end
end
