class Doctor < ApplicationRecord
    has_many :doctor_patients
    has_many :patients, through: :doctor_patients
    has_many :appointments
    has_many :medical_records  

  end
  