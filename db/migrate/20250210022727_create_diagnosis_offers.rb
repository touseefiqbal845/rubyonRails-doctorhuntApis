class CreateDiagnosisOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :diagnosis_offers do |t|
      t.string :name
      t.integer :age
      t.integer :tests_offer
      t.decimal :price
      t.json :services  
      t.timestamps  
    end
  end
end
