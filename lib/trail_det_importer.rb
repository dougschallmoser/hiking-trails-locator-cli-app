require 'open-uri'
require 'nokogiri'
require 'pry'

## Scrapes data from specific trail page

class TrailDetailImporter

    def self.get_trail_details(trail_url)
        trail_url = "https://www.hikingproject.com/trail/7000130/bear-peak-out-and-back"
        doc = Nokogiri::HTML(open(trail_url))
        details = {}

        doc.each do |i|
            details[:name] = i.css("div.row").css("h1").text,
            details[:difficulty] = i.css("div.trail-subheader span.difficulty-text").text,
            details[:incline] = i.css("div.stat-block mx-1")

        end
        details
        binding.pry
    end 

end 

new = TrailDetailImporter.get_trail_details("https://www.hikingproject.com/trail/7000130/bear-peak-out-and-back")



