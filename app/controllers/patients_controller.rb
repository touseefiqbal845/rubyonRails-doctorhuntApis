class PatientsController < ApplicationController
    before_action :set_patient, only: [:show, :update, :destroy]
  
    # GET /patients
    def index
        patients = Patient.includes(:doctors, :medical_records, :appointments).all
        render json: patients.to_json(include: [:doctors, :medical_records, :appointments])
      end
  
    # GET /patients/:id
    def show
      render json: @patient.as_json(include: [:doctors,  :appointments])
    end
  
    # POST /patients
    def create
      patient = Patient.new(patient_params)
      if patient.save
        render json: patient, status: :created
      else
        render json: patient.errors, status: :unprocessable_entity
      end
    end
  
    # PUT /patients/:id
    def update
      if @patient.update(patient_params)
        render json: @patient
      else
        render json: @patient.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /patients/:id
    def destroy
      @patient.destroy
      head :no_content

    end
  
    private
  
    def set_patient
      @patient = Patient.find(params[:id])
    end
  
    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :age, :gender, :location, :status, contact_info: {}, doctor_ids: [])
    end
  end
  