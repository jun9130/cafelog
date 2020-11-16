class ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_shop, only: [:show, :edit, :update]

  
  def new
    @shop = Shop.new
    5.times{@shop.shop_images.build}
  end

  def create
    @shop = Shop.new(shop_params) #フォームの内容をDBに保存
    if @shop.save
      redirect_to root_path, notice: 'カフェを登録しました'
    else
      render new_shop_path
    end
  end

  def index
    @shops = Shop.includes(:shop_images).order('id DESC').page(params[:page]).per(9)
  end

  def show
    @images = @shop.shop_images
    @image = @images.first
    @reviews = @shop.reviews.includes(:user).order('updated_at DESC')
    @like = Like.new
    @average_rate = @shop.reviews.average(:rate)
  end

  def edit
  end

  def update
    if @shop.update(shop_update_params)
      redirect_to shop_path, notice: 'カフェ登録内容を編集しました'
    else
      render :edit
    end
  end

  def search
    @tag = Tag.find(params[:tag_id]) 
    @shops = @tag.shops.all
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :access, :address, :business_hours, :holiday, :seat, tag_ids: [name: [] ], shop_images_attributes: [:image, :id]).merge(user_id: current_user.id)
  end

  def shop_update_params
    params.require(:shop).permit(:name, :access, :address, :business_hours, :holiday, :seat, tag_ids: [], shop_images_attributes: [:image, :id]).merge(user_id: current_user.id)
  end

end
