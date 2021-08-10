class ReviewsController < ApplicationController
  before_action :find_review, only: [:edit, :update, :destroy]
  before_action :set_dress, except: [:destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    @review.dress = @dress
    @review.user = current_user
    if @review.save
      redirect_to dress_path(@dress)
      redirect_to dress_path(@dress, anchor: "review-#{@review.id}")
    else
      render :new
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    if @review.save
      redirect_to dress_path(@dress)
    else
      render :edit
    end
  end

  def destroy
    @review.dress = @dress
    @review.delete
    redirect_to dress_path(@dress)
  end

  private

  def find_review
    @review = Review.find(params[:id])
  end

  def set_dress
    @dress = Dress.find(params[:dress_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :dress_id, :user_id)
  end
end
