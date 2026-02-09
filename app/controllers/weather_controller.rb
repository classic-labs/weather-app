class WeatherController < LoginsController
  def current_weather
    weather_data = WeatherService::by_zip_code(params[:zip_code])
    
    if weather_data[:cached]
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace("form-messages", partial: "weather/error", locals: { error: "Weather is from cache" }),
            turbo_stream.replace("current-weather", partial: "weather/current", locals: { weather_data: weather_data[:data] })
          ]
        end
        format.html { render :index, status: :unprocessable_entity }
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace("form-messages", partial: "weather/error"),
            turbo_stream.replace("current-weather", partial: "weather/current", locals: { weather_data: weather_data[:data] })
          ]
        end
        format.html { redirect_to dashboard_path }
      end
    end
  end
end
