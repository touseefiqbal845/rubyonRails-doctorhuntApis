class CreateMedicalRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :medical_records do |t|
      t.references :patient, null: false, foreign_key: true
      t.text :prescription
      t.date :date

      t.timestamps
    end
  end
end
