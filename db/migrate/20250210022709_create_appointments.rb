class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.time :time
      t.date :date
      t.json :location, default: {}
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
