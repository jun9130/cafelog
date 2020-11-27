require 'rails_helper'

describe PagesController, type: :controller do
  describe 'GET #privacy' do
    it "privacy.html.hamlに遷移するか" do
      get :privacy
      expect(response).to render_template :privacy
    end
  end

  describe 'GET #rule' do
    it "rule.html.hamlに遷移するか" do
      get :rule
      expect(response).to render_template :rule
    end
  end
end
