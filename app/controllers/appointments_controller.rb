class AppointmentsController < ApplicationController
    before_action :set_appointment, only: [:show, :update, :destroy]
  
    # GET /appointments
    def index
      appointments = Appointment.includes(:patient, :doctor).all
      render json: appointments.as_json(include: [:patient, :doctor])
    end
  
    # GET /appointments/:id
    def show
      render json: @appointment.as_json(include: [:patient, :doctor])
    end
  
    # POST /appointments
    def create
      appointment = Appointment.new(appointment_params)
      if appointment.save
        render json: appointment, status: :created
      else
        render json: appointment.errors, status: :unprocessable_entity
      end
    end
  
    # PUT /appointments/:id
    def update
      if @appointment.update(appointment_params)
        render json: @appointment
      else
        render json: @appointment.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /appointments/:id
    def destroy
      @appointment.destroy
      head :no_content
    end
  
    private
  
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end
  
    def appointment_params
      params.require(:appointment).permit(:patient_id, :doctor_id, :time, :date, :status, location: {})
    end
  end
  