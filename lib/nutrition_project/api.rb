class API

    
  
    def self.get_data
        url = URI("https://trackapi.nutritionix.com/v2/search/instant?detailed=true&query=#{NutritionProject::CLI.data}")
        
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        
        
        request = Net::HTTP::Get.new(url)
        request["x-app-key"] = ENV["MY_KEY"]
        request["x-app-id"] = ENV["MY_ID"]
        response = http.request(request)
        array = JSON.parse(response.read_body)["common"]
        array
        
    end

    

    
end