class BookingsController < ApplicationController
  before_action :set_user
  before_action :set_dress, except: [:my_bookings]
  before_action :find_user, only: [:show, :edit, :update, :destroy]

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
      redirect_to dress_bookings_path(@dress)
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
    @booking.delete
  end

  def my_bookings
    @bookings = []
    Booking.all.each do |booking|
      if booking.user == current_user
        @bookings << booking
      end
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :dress_id, :confirmed)
  end

  def set_user
    if user_signed_in?
      @user = current_user
    end
  end

  def set_dress
    @dress = Dress.find(params[:dress_id])
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
