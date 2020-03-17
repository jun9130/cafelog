class ReviewsController < ApplicationController
  before_action :set_star_array, only: [:new]

  def new
    @shop = Shop.find(params[:shop_id])
    @review = Review.new
  end

  def create
    Review.create(review_params)
    redirect_to root_path, notice: 'レビューを投稿しました'
  end

  private
  def review_params
    params.require(:review).permit(:rate, :text).merge(shop_id: params[:shop_id], user_id: current_user.id)
  end

  def set_star_array
    @star_array = ['--','1','2','3','4','5']
  end

end
