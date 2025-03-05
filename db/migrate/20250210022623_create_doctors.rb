class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :career
      t.string :experience
      t.string :speciality
      t.json :stories, default: {}
      t.float :rating, default: 0
      t.boolean :is_favourite, default: false
      t.integer :reviews, default: 0
      t.decimal :hour_rate, precision: 10, scale: 2
      t.json :time_slot, default: {}
      t.json :details, default: {}
      t.boolean :is_featured, default: false

      t.timestamps
    end
  end
end
