class CreateGeocodes < ActiveRecord::Migration
  def self.up
    create_table :geocodes do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :geocodes
  end
end
