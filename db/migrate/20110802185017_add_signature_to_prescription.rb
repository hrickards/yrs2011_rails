class AddSignatureToPrescription < ActiveRecord::Migration
  def self.up
    add_column :prescriptions, :signature, :text
  end

  def self.down
    remove_column :prescriptions, :signature
  end
end
