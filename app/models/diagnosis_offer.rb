class DiagnosisOffer < ApplicationRecord
    validates :name, :age, :tests_offer, :price, presence: true
  
    store_accessor :services
  end
  