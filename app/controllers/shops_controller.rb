class ShopsController < ApplicationController
  
  before_action :set_shop, only: [:edit, :update]

  
  def new
    @shop = Shop.new
    @image = @shop.shop_images.build
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to root_path, notice: 'カフェを登録しました'
    else
      redirect_to new_shop_path, notice: '登録に失敗しました'
    end
  end

  def index
    @shops = Shop.includes(:shop_images).order('id DESC').page(params[:page]).per(9)
  end

  def show
    @shop = Shop.find(params[:id])
    @images = @shop.shop_images
    @image = @images.first
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

  private

  def set_shop
    @shop = Shop.find(params[:id])
    @image = @shop.shop_images
  end

  def shop_params
    params.require(:shop).permit(:name, :access, :address, :business_hours, :holiday, :seat, shop_images_attributes: [:image, :id]).merge(user_id: current_user.id)
  end

  def shop_update_params
    params.require(:shop).permit(:name, :access, :address, :business_hours, :holiday, :seat, shop_images_attributes: [:image, :id]).merge(user_id: current_user.id)
  end

end
