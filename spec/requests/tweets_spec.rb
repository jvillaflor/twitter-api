require 'rails_helper'

RSpec.describe "Tweet", type: :request do
    describe "POST /api/tweets/temperatures" do
        it "returns http success" do
            post "/api/tweets/temperatures", params: {
              appid: ENV["OPEN_WEATHER_MAP_APPID"]
            }
            expect(response).to have_http_status(:success)
            json = JSON.parse(response.body).deep_symbolize_keys
            expect(json.has_key?(:url)).to be true
        end
    end
end