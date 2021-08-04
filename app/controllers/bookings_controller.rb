class BookingsController < ApplicationController
  # before_action :set_user
  before_action :set_dress, except: [:my_bookings, :booking_requests, :destroy]
  before_action :find_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Bookings.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.dress = @dress
    @booking.confirmed = false
    if @booking.save
      redirect_to dress_path(@dress)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    if @booking.save
      redirect_to dress_path(@dress)
    else
      render :edit
    end
  end

  def destroy
    if @booking.delete
      redirect_to booking_requests_path
    end
  end

  def my_bookings
    @bookings = []
    Booking.all.each do |booking|
      if booking.user == current_user
        @bookings << booking
      end
    end
  end

  def booking_requests
    @bookings = []
    Booking.all.each do |booking|
      if booking.dress.user == current_user
        @bookings << booking
      end
    end
  end

  def confirm
    @booking.update(confirmed: true)
    if @booking.save
      redirect_to booking_requests_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :dress_id, :confirmed)
  end

  # def set_user
  #   if user_signed_in?
  #     @user = current_user
  #   end
  # end

  def set_dress
    @dress = Dress.find(params[:dress_id])
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
