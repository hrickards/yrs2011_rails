class CreateBookings < ActiveRecord::Migration
  def self.up
    create_table :bookings do |t|
      t.integer :gp_id
      t.datetime :time
      t.text :message

      t.timestamps
    end
  end

  def self.down
    drop_table :bookings
  end
end
