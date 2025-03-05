class MedicalRecordsController < ApplicationController
    before_action :set_medical_record, only: [:show, :update, :destroy]
  
    # GET /medical_records
    def index
      medical_records = MedicalRecord.includes(:patient).all
      render json: medical_records.as_json(include: :patient)
    end
  
    # GET /medical_records/:id
    def show
      render json: @medical_record.as_json(include: :patient)
    end
  
    # POST /medical_records
    def create
      medical_record = MedicalRecord.new(medical_record_params)
      if medical_record.save
        render json: medical_record, status: :created
      else
        render json: medical_record.errors, status: :unprocessable_entity
      end
    end
  
    # PUT /medical_records/:id
    def update
      if @medical_record.update(medical_record_params)
        render json: @medical_record
      else
        render json: @medical_record.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /medical_records/:id
    def destroy
      @medical_record.destroy
      head :no_content
    end
  
    private
  
    def set_medical_record
      @medical_record = MedicalRecord.find(params[:id])
    end
  
    def medical_record_params
      params.require(:medical_record).permit(:patient_id, :prescription, :date)
    end
  end
  