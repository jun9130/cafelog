require 'rails_helper'

describe ReviewsController, type: :controller do
  describe 'GET #new' do
    it "new.html.haml に遷移するか" do
      get :new, params: { shop_id: 3 }
      expect(response).to render_template :new
    end 
  end
end
