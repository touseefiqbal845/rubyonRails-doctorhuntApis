class DiagnosisOffersController < ApplicationController
    before_action :set_diagnosis_offer, only: [:show, :update, :destroy]
  
    # GET /diagnosis_offers
    def index
      diagnosis_offers = DiagnosisOffer.all
      render json: diagnosis_offers
    end
  
    # GET /diagnosis_offers/:id
    def show
      render json: @diagnosis_offer
    end
  
    # POST /diagnosis_offers
    def create
      diagnosis_offer = DiagnosisOffer.new(diagnosis_offer_params)
      if diagnosis_offer.save
        render json: diagnosis_offer, status: :created
      else
        render json: diagnosis_offer.errors, status: :unprocessable_entity
      end
    end
  
    # PUT /diagnosis_offers/:id
    def update
      if @diagnosis_offer.update(diagnosis_offer_params)
        render json: @diagnosis_offer
      else
        render json: @diagnosis_offer.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /diagnosis_offers/:id
    def destroy
      @diagnosis_offer.destroy
      head :no_content
    end
  
    private
  
    def set_diagnosis_offer
      @diagnosis_offer = DiagnosisOffer.find(params[:id])
    end
  
    def diagnosis_offer_params
      params.require(:diagnosis_offer).permit(:name, :age, :tests_offer, :price, services: [])
    end
  end
  