class BookingsController < ApplicationController
  before_action :set_apartment, only: [:create, :new, :show]
  before_action :set_booking, only: [:show]

  def index
  end

  def show
  end

  def new
    @booking = @apartment.bookings.new
  end

  def create
    @booking = current_user.bookings.new(booking_params)
    if @booking.save
      redirect_to apartment_booking_path(@apartment.id, @booking.id)
    else
      render :new
    end
  end

  def edit
  end

  def update

  end

  def destroy

  end

 private

  def set_apartment
    @apartment = Apartment.find(params[:apartment_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
