class WeatherService
  def self.by_zip_code(zip_code)
    unless ValidatesZipcode.valid?(zip_code, 'US')
      raise StandardError, "Zip code is invalid"
    end
    
    cache_key = "weather:#{zip_code}"
    cached_data = Rails.cache.read(cache_key)

    if cached_data
      { data: cached_data, cached: true, error: "Weather is from cache" }
    else
      client = OpenWeather::Client.new(api_key: ENV['OPEN_WEATHER_API_KEY'])
      data = client.current_zip(zip_code, 'US')
      Rails.cache.write(cache_key, data, expires_in: 30.minutes)
      { data: data, cached: false }
    end
  rescue StandardError => e
    Rails.logger.error("Error fetching weather for zip code: #{zip_code}. Message: #{e.message}")
    nil
  end
end
