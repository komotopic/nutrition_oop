class API
  
    def self.get_data
        url = URI("https://trackapi.nutritionix.com/v2/search/instant?detailed=true&query=olive oil")
        
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        
        key = "#{env.key"
        request = Net::HTTP::Get.new(url)
        request["x-app-key"] = key 
        request["x-app-id"] = '6262d88a'
        response = http.request(request)
        array = JSON.parse(response.read_body)["common"]
         binding.pry
        
    end

#     def self.nutrition_request
#         url = URI("https://trackapi.nutritionix.com/v2/natural/nutrients")
#         # data = @array.dig(0,"food_name")
       
#         http = Net::HTTP.new(url.host, url.port)
#         http.use_ssl = true
#         http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        
        
#         key = "52a1dcb9737706afc1f2ce0217236027"
#         # request = 
#         request = Net::HTTP::Post.new(url.path, {'Content-Type'=> 'application/json', "x-app-key" => key, "x-app-id" => '6262d88a', "x-remote-user-id" => '0' })
#         # request["x-app-key"] = key
#         # request["x-app-id"] = '6262d88a'
#         # request["x-remote-user-id"] = '0'
#         request.body = {
#             "query": "1 cup of banana",
#             "num_servings": 1,
#             "aggregate": "string",
#             "line_delimited": false,
#             "use_raw_foods": true,
#             "include_subrecipe": false,
#             "timezone": "",
#             "consumed_at": "",
#             "lat": 0,
#             "lng": 0,
#             "meal_type": 0,
#             "use_branded_foods": false,
#             "locale": "en_US",
#             "taxonomy": false
#         }.to_s
#         response = http.request(request)
#         array = JSON.parse(response.read_body)
#         binding.pry
#     end
 end