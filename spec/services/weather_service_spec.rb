require 'rails_helper'

RSpec.describe WeatherService, type: :service do
  let(:weather_service) { described_class }
  let(:zip_code) { '49441' } # Muskegon, MI Zip Code
  let(:api_key) { 'fake_api_key' }
  let(:api_url) { "https://api.openweathermap.org/data/2.5/weather" }
  let(:status) { 200 }
  let(:mock_response) do
    { "name"=>"Muskegon" }.to_json
  end
  let(:headers) { { 'Content-Type' => 'application/json' } }
  
  describe '.by_zip_code' do
    it "stubs the weather request by zip code", :external_api do
      # stub the request and return a predefined response, e.g. name = Muskegon
      stub_request(:get, api_url)
      .with(
        query: hash_including({
          "zip" => "#{zip_code},US",
          "appid" => api_key
        })
      )
      .to_return(status: status, body: mock_response, headers: headers)
      
      # call WeatherService to compare expected data with stubbed data
      weather_data = weather_service.by_zip_code(zip_code)
      expect(weather_data[:data]).not_to be_nil
      expect(weather_data[:data][:name]).to eq("Muskegon")
      expect(WebMock).to have_requested(:get, api_url).once
    end
  end
end
