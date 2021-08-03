class DressesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_dress, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  def index
    @dresses = Dress.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @dress = Dress.new
  end

  def create
    @dress = Dress.new(dress_params)
    @dress.user = @user
    if @dress.save
      redirect_to dress_path(@dress)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @dress.update(dress_params)
    if @dress.save
      redirect_to dress_path(@dress)
    else
      render :edit
    end
  end

  def destroy
    @dress.delete
    redirect_to dresses_path
  end

  def my_dresses
    @dresses = []
    Dress.all.each do |dress|
      if dress.user == current_user
        @dresses << dress
      end
    end
  end

  private

  def set_dress
    @dress = Dress.find(params[:id])
  end

  def set_user
    if user_signed_in?
      @user = current_user
    end
  end

  def dress_params
    params.require(:dress).permit(:title, :description, :size, :brand, :price, :photos)
  end
end
