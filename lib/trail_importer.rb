# Application Programming Interface 

class TrailImporter

    @@api = "200850712-41bb2ec1278a205fdc5c9050b10c3ad2" 

    def self.get_trails_by_lat_long(lat, long, dist)
        url = "https://www.hikingproject.com/data/get-trails?lat=#{lat}&lon=#{long}&maxDistance=#{dist}&key=#{@@api}"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        output = JSON.parse(response.body)
        trail_choices = []
        output["trails"].each do |trail|
            hash = {
                :trail_id => trail["id"],
                :name => trail["name"],
                :summary => trail["summary"],
                :length => trail["length"],
                :url => trail["url"]
            }
            trail_choices << hash 
        end 
        trail_choices 
    end

end

