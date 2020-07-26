require 'open-uri'
require 'nokogiri'
require 'pry'

## Scrapes data from specific trail page

class TrailDetailImporter

    def self.get_trail_details(trail_url)
        doc = Nokogiri::HTML(open(trail_url))
    end 

end 