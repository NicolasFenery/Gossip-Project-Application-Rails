require 'rails_helper'

RSpec.describe GossipsController, type: :controller do

  describe "GET #card" do
    it "returns http success" do
      get :card
      expect(response).to have_http_status(:success)
    end
  end

end
