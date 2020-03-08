class ShopsController < ApplicationController
  
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
  end

  def show
    @shop = Shop.find(params[:id])
    @images = @shop.shop_images
    @image = @images.first
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :access, :address, :business_hours, :holiday, :seat, shop_images_attributes: [:image, :id]).merge(user_id: current_user.id)
  end
end
