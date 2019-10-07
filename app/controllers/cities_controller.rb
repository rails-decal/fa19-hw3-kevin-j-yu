class CitiesController < ApplicationController
    def view
        @city = params[:city]
    end
    def new
        if params[:name] and params[:landmark] and params[:population]
            create(params)
        end
    end
    def create(params)
        if not City.all.key?(params[:name].to_sym)
            city = City.new(
                name: params[:name],
                landmark: params[:landmark],
                population: params[:population],
            )
            city.save
        end
        redirect_to "/cities/view"
    end
    def update_get
        if params[:name] and (params[:landmark] or params[:population])
            update_post(params)
        end
    end
    def update_post(params)
        if City.all[params[:name].to_sym]
            City.all[params[:name].to_sym].update(landmark: params[:landmark], population: params[:population])
        end
        redirect_to "/cities/view"
    end
end
