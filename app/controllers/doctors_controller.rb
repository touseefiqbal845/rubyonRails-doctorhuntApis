# app/controllers/doctors_controller.rb
class DoctorsController < ApplicationController
    before_action :set_doctor, only: [:show, :update, :destroy]
  
    # GET /doctors
    def index
      doctors = Doctor.all
      search_feature = SearchFeatures.new(doctors, params)
                                       .search
                                       .filter
                                       .pagination(10)
      doctors = search_feature.get_queryset
  
      render json: {
        success: true,
        message: "Doctors retrieved successfully",
        doctors: doctors.as_json(include: [:patients, :appointments]),
        doctorsCount: Doctor.count,
        resultPerPage: 10,
        filteredDoctorsCount: doctors.size
      }, status: :ok
    end
  
    # POST /doctors
    def create
      doctor = Doctor.new(doctor_params)
      if doctor.save
        render json: {
          success: true,
          message: "Doctor created successfully",
          doctor: doctor
        }, status: :created
      else
        render json: { errors: doctor.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # GET /doctors/:id
    def show
      # Eager-load associations for efficiency.
      @doctor = Doctor.includes(:patients, :appointments,).find(params[:id])
      render json: {
        success: true,
        message: "Doctor retrieved successfully",
        doctor: @doctor.as_json(include: {
          patients: {},
          appointments: {}
        })
      }, status: :ok
    end
  
    # PUT/PATCH /doctors/:id
    def update
      if @doctor.update(doctor_params)
        render json: {
          success: true,
          message: "Doctor updated successfully",
          doctor: @doctor
        }, status: :ok
      else
        render json: { errors: @doctor.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # DELETE /doctors/:id
    def destroy
      @doctor.destroy
      render json: { success: true, message: "Doctor deleted successfully" }, status: :no_content
    end
  
    # GET /doctors/popular
    def popular
      doctors = Doctor
                  .left_joins(:appointments)
                  .where(appointments: { status: ['confirmed', 'completed'] })
                  .select('doctors.*, COUNT(appointments.id) AS active_appointments_count')
                  .group('doctors.id')
                  .order("rating DESC, reviews DESC, active_appointments_count DESC, is_favourite DESC")
                  .limit(5)
  
      render json: {
        success: true,
        message: "Top 5 doctors fetched successfully",
        data: doctors
      }, status: :ok
    end
  
    # GET /doctors/featured
    def featured
      doctors = Doctor.where(is_featured: true)
      render json: {
        success: true,
        message: "Featured doctors fetched successfully",
        data: doctors
      }, status: :ok
    end
  
    # GET /doctors/by_career?career=...
    def by_career
      career = params[:career]
      if career.blank?
        render json: { error: "Career field is required" }, status: :bad_request and return
      end
      doctors = Doctor.where("LOWER(career) = ?", career.downcase)
      render json: {
        success: true,
        message: "Doctors retrieved successfully",
        doctors: doctors
      }, status: :ok
    end
  
    # GET /doctors/favorites
    def favorites
      doctors = Doctor.where(is_favourite: true)
      render json: {
        success: true,
        message: "Favorite doctors retrieved successfully",
        doctors: doctors
      }, status: :ok
    end
  
    private
  
    def set_doctor
      @doctor = Doctor.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Doctor not found" }, status: :not_found
    end
  
    def doctor_params
      params.require(:doctor).permit(
        :name, :career, :experience, :speciality, :hour_rate, 
        :is_featured, :rating, :is_favourite, :reviews, 
        stories: [:success], 
        time_slot: [:morning, :afternoon], 
        details: [:clinic, :address], 
        patient_ids: []
      )
    end
  end
  