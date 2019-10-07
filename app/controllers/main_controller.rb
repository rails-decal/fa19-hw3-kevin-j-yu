require_relative '../services/weather_service'

class MainController < ApplicationController

  def index
    if params[:city]
      city = City.new(
          name: params[:city],
          population: params[:population],  
          landmark: params[:landmark]
        )
      @city = city.name
      @w = city.weather
      # Bonus: Converting Kelvin to Fahrenheit
      if not @w.nil?
        @temperature = (9.0 / 5) * (@w[:temperature] - 273) + 32
      end
      # Save the city so that it's in City.all
      city.save
    end
  end

end
