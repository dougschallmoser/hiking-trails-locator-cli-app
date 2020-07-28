# Data Representation of API

class Trail

    attr_accessor :trail_id, :name, :summary, :length, :url

    @@all = []

    def initialize(trail_hash)
        trail_hash.each {|k,v| self.send("#{k}=", v)}
        @@all << self 
    end 

    def self.create_from_collection(trail_array)
        if !self.all.include?(self)
            trail_array.each {|trail| self.new(trail)}
        end
    end 

    def self.all
        @@all
    end 

end 

