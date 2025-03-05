class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :gender
      t.string :location
      t.json :contact_info, default: {}

      t.timestamps
    end
  end
end
