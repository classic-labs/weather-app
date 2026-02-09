require 'rails_helper'

RSpec.describe WeatherService, type: :service do
  describe '#by_zip_code' do
    let(:service) { described_class }
    let(:zip_code) { '49441' } # Muskegon, MI Zip Code
    let(:api_key) { 'fake_api_key' }
    let(:api_url) { "https://api.openweathermap.org/data/2.5/weather" }
    let(:status) { 200 }
    let(:body) do
      { "name"=>"Muskegon" }.to_json
    end
    let(:headers) { { 'Content-Type' => 'application/json' } }
    
    before do
      # stub the request and return a predefined response, e.g. name = Muskegon
      stub_request(:get, api_url)
      .with(
        query: hash_including({
          "zip" => "#{zip_code},us",
          "appid" => api_key
        }),
        headers: {
     	  'Accept'=>'application/json; charset=utf-8',
     	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     	  'Content-Type'=>'application/json',
     	  'User-Agent'=>'OpenWeather Ruby Client/0.6.0'
      })
      .to_return(status: status, body: body, headers: headers)
    end
    
    it "stubs the weather request by zip code" do
      # call WeatherService to compare expected data with stubbed data
      #weather_data = service.by_zip_code(zip_code)
      #expect(weather_data["data"]["name"]).to eq("Muskegon")
      #expect(WebMock).to have_requested(:get, api_url).once
    end
  end
end
