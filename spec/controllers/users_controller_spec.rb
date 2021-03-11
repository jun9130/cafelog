require 'rails_helper'

describe UsersController, type: :controller do
  describe 'GET #edit' do
    it "edit.html.erbに遷移するか" do
      get :edit, params: { id: 19 }
      expect(response).to render_template :edit
    end
  end
end
