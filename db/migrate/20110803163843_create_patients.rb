class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table :patients do |t|
      t.string :name
      t.string :address_line_one
      t.string :town
      t.string :county
      t.string :postcode

      t.timestamps
    end
  end

  def self.down
    drop_table :patients
  end
end
