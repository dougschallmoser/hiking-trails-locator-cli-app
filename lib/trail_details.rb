
## Class that represents data retrieved from API

class TrailDetails

    attr_accessor :name, :difficulty, :description, :length, :route, :high_elev, :low_elev, :elev_gain, :dogs

    @@all = []

    def initialize(detail_hash)
        detail_hash.each {|k,v| self.send("#{k}=", v)}
        @@all << self
    end 

    def self.all
        @@all 
    end 

end 

