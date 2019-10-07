class City
    attr_accessor :name, :temperature, :description
    $cities = []

	def initialize(city_params)
		@name = city_params[:name]
		@temperature = city_params[:temperature]
		@description = city_params[:description]
    end
    
    def save
        $cities << self
    end
        
    def self.all
     	$cities
    end
end