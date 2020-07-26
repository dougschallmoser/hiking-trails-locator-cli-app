require 'json'

## Imports data from Hiking Project API

class TrailImporter

    @@api = "200850712-41bb2ec1278a205fdc5c9050b10c3ad2" 

    def self.get_trails_by_lat_long(lat, long)
        url = "https://www.hikingproject.com/data/get-trails?lat=#{lat}&lon=#{long}&maxDistance=40&key=200850712-41bb2ec1278a205fdc5c9050b10c3ad2"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        JSON.parse(response.body)
    end

end 