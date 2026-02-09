require 'rails_helper'

RSpec.describe "Weathers", type: :request do
  describe "GET /current_weather" do
    it "returns http success" do
      get "/weather/current_weather"
      expect(response).to have_http_status(:success)
    end
  end

end
