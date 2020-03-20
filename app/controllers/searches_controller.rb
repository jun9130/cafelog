class SearchesController < ApplicationController

  def index
    @keyword = params[:keyword]
    @shops = Shop.where('name LIKE(?) OR access LIKE(?) OR address LIKE(?)', "%#{@keyword}%", "%#{@keyword}%", "%#{@keyword}%")
  end
end
