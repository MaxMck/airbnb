class ApartmentsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query]
      @apartments = Apartment.search(params[:query])
    else
      @apartments = Apartment.all
    end
  end

  def show
  end

  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = current_user.apartments.new(apartment_params)
    @apartment.save
    flash[:notice] = "Your apartment has been created"
    redirect_to @apartment
  end

  def edit
  end

  def update
    @apartment.update(apartment_params)
    redirect_to @apartment
  end

  def destroy
    @apartment.destroy
    redirect_to apartments_path
  end

 private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_params
      params.require(:apartment).permit(:country, :city, :address, :capacity,
        :main_picture, :description, :title, :picture, :price_per_night)
    end
end
