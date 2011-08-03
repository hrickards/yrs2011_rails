class CreateWikipedia < ActiveRecord::Migration
  def self.up
    create_table :wikipedia do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :wikipedia
  end
end
