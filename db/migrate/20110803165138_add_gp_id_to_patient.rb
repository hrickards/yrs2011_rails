class AddGpIdToPatient < ActiveRecord::Migration
  def self.up
    add_column :patients, :gp_id, :integer
  end

  def self.down
    remove_column :patients, :gp_id
  end
end
