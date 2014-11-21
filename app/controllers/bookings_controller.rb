class BookingsController < ApplicationController
  before_action :set_apartment, only: [:create, :new, :show, :confirm, :addreview]
  before_action :set_booking, only: [:show, :addreview, :update ]

  def index
  end

  def show
  end

  def new
    @booking = @apartment.bookings.new
  end

  def confirm
    @booking = current_user.bookings.new(booking_params)
  end

  def create
    @booking = current_user.bookings.new(booking_params)
    if @booking.save
      redirect_to apartment_booking_path(@apartment.id, @booking.id)
    else
      render :new
    end
  end

  def addreview
  end

  def edit
  end

  def update
    if @booking.update(booking_params2)
     redirect_to user_path(current_user.id)
    else
      render :addreview
    end
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
    params.require(:booking).permit(:start_date, :end_date, :apartment_id)
  end

  def booking_params2
    params.require(:booking).permit(:start_date, :end_date, :apartment_id, :apartment_review)
  end
end
