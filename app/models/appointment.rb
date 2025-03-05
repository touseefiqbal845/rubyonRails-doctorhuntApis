class Appointment < ApplicationRecord
    belongs_to :patient
    belongs_to :doctor
  
    validates :time, :date, presence: true
    store_accessor :location
  end
  