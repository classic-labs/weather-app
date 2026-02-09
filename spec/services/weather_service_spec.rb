require 'rails_helper'
require 'webmock/rspec'

RSpec.describe WeatherService, type: :service do
  describe '#by_zip_code' do
    let(:zip_code) { '49441' }
    let(:api_key) { 'fake_api_key' }
    let(:service) { described_class }
    let(:api_url) { "https://api.openweathermap.org/data/2.5/weather?zip=#{zip_code}&appid=#{api_key}&units=standard" }
    let(:stubbed_response) do
      '{"coord"=>{"lon"=>-86.2738, "lat"=>43.1962}, "weather"=>[{"icon_uri"=>"http://openweathermap.org/img/wn/01n@2x.png", "icon"=>"01n", "id"=>800, "main"=>"Clear", "description"=>"clear sky"}], "base"=>"stations", "main"=>{"temp"=>264.95, "feels_like"=>258.69, "temp_min"=>264.29, "temp_max"=>265.36, "pressure"=>1029, "humidity"=>55, "sea_level"=>1029, "grnd_level"=>1005}, "visibility"=>10000, "wind"=>{"speed"=>4.12, "deg"=>110}, "clouds"=>{"all"=>0}, "rain"=>nil, "snow"=>nil, "dt"=>"2026-02-09T02:37:51.000Z", "sys"=>{"type"=>2, "id"=>2009325, "country"=>"US", "sunrise"=>"2026-02-08T12:52:30.000Z", "sunset"=>"2026-02-08T23:06:09.000Z"}, "id"=>0, "timezone"=>-18000, "name"=>"Muskegon", "cod"=>200}'
    end
    
    before do
      # Disable real network connections and stub the request
      WebMock.disable_net_connect!(allow_localhost: true)
      stub_request(:get, api_url)
      .with(headers: { 'Accept' => '*/*', 'User-Agent' => 'Ruby' })
      .to_return(status: 200, body: stubbed_response, headers: {})
    end

    after do
      WebMock.allow_net_connect!
    end

    it 'fetches and parses weather data for a zip code' do
      weather_data = service::by_zip_code(zip_code)
      expect(weather_data).to be_a(Hash)
      expect(weather_data['name']).to eq('Muskegon')
      expect(weather_data['main']['temp']).to eq(264.95)
      expect(weather_data['weather'].first['description']).to include('clear sky')
    end
  end
end
