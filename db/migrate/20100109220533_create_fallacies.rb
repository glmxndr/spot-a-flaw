class CreateFallacies < ActiveRecord::Migration
  def self.up
    create_table :fallacies do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :fallacies
  end
end
