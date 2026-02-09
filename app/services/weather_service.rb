class WeatherService
  class ApiError < StandardError; end
  class NotFoundError < ApiError; end
  class UnauthorizedError < ApiError; end
  class ServerError < ApiError; end
  
  def self.by_zip_code(zip_code)
    unless ValidatesZipcode.valid?(zip_code, 'US')
      return { error: "Zip code is invalid" }
    end
    
    begin
      cache_key = "weather:#{zip_code}"
      cached_data = Rails.cache.read(cache_key)

      if cached_data
        # data is cached, return it and indicate it's from the cache
        { data: cached_data, cached: true, error: "Weather is from cache" }
      else
        # data is not cached, fetch it, cache it and indicate it's not from the cache
        client = OpenWeather::Client.new(api_key: ENV['OPEN_WEATHER_API_KEY'])
        data = client.current_zip(zip_code, 'US')
        
        Rails.cache.write(cache_key, data, expires_in: 30.minutes)
        { data: data, cached: false }
      end
    rescue Faraday::ResourceNotFound
      raise NotFoundError, "Resource not found on the weather API"
    rescue Faraday::UnauthorizedError, Faraday::ForbiddenError => e
      raise UnauthorizedError, "Not authorized to access the weather API. Error: #{e.message}"
    rescue Faraday::ClientError => e
      raise ApiError, "An API client error occurred. Error: #{e.message}"
    rescue Faraday::ServerError
      raise ServerError, "The external API is currently unavailable"
    end
  end
end
