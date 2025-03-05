class MedicalRecord < ApplicationRecord
    belongs_to :patient
    
  
    validates :prescription, :date, presence: true
  end
  