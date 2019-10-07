require_relative '../services/weather_service'

class MainController < ApplicationController

  def index
    @w = WeatherService.get(params[:city])
    if @w
      # Bonus: Converting Kelvin to Fahrenheit
      @temperature = (9.0 / 5) * (@w[:temperature] - 273) + 32
      # Create a new city
      city = City.new(
        name: params[:city],
        temperature: @temperature, # Using the converted temperature
        description: @w[:description]
      )
      # Save the city so that it's in City.all
      city.save
    end
  end

end
