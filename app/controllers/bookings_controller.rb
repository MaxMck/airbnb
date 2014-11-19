class BookingsController < ApplicationController
  before_action :set_apartment, only: [:create, :new]


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
      redirect_to user_booking_path(current_user.id, @booking.id)
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
    @booking = Booking.find(params[:booking_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
