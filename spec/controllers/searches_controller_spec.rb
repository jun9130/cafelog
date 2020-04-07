require 'rails_helper'

describe SearchesController do
  describe 'GET #index' do
    it "index.html.hamlに推移するか" do
      get :index
      expect(response).to render_template :index
    end
  end
end
