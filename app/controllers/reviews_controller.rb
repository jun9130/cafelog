class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_shop_review, only: [:new, :create]


  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
    redirect_to root_path, notice: 'レビューを投稿しました'
    else 
      flash.now[:alert] = 'レビューを入力してください'
      render :new
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy if review.user_id == current_user.id
    redirect_to root_path
    flash[:alert] = 'レビューを削除しました'
  end


  private
  def review_params
    params.require(:review).permit(:rate, :text).merge(shop_id: params[:shop_id], user_id: current_user.id)
  end

  def set_shop_review
    @shop = Shop.find(params[:shop_id])
    @star_array = ['--','1','2','3','4','5']
  end

end
