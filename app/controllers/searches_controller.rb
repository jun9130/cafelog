class SearchesController < ApplicationController

  def index
    @keyword = params[:keyword]
    @shops = Shop.where('name LIKE(?) OR access LIKE(?) OR address LIKE(?)', "%#{@keyword}%", "%#{@keyword}%", "%#{@keyword}%").order('created_at DESC')
  end
end
