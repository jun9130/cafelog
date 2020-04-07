require 'rails_helper'

describe ShopsController do
  describe 'GET #new' do
    it "new.html.hamlに遷移するか" do
      get :new
      expect(response).to render_template :new
    end
  end
  
  describe 'GET #index' do
    it "@shopsに正しい値が入っているか" do
      shops = create_list(:shop, 3)
      get :index
    end
    it "index.html.hamlに遷移するか" do
      get :index
      expect(response).to render_template :index
    end
  end
end

