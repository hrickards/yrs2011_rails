class CreatePrescriptions < ActiveRecord::Migration
  def self.up
    create_table :prescriptions do |t|
      t.integer :patient_id
      t.string :din
      t.string :item
      t.string :strength
      t.string :amount
      t.string :when

      t.timestamps
    end
  end

  def self.down
    drop_table :prescriptions
  end
end
