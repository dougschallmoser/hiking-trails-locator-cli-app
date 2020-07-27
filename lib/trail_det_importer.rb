require 'open-uri'
require 'nokogiri'
require 'pry'

## Scrapes data from specific trail page

class TrailDetailImporter

    def self.get_trail_details(trail_url)
        doc = Nokogiri::HTML(open(trail_url))
        details = {}
        details[:name] = doc.css("div.row").css("h1").text.strip
        details[:difficulty] = doc.css("div.trail-subheader span.difficulty-text").text.strip
        details[:overview] = doc.css("div.main-content-container").css("div.mb-1")[3].text.strip
        details[:description] = doc.css("div.main-content-container").css("div.mb-1")[4].text.strip
        details[:length] = doc.css("div.mt-2#trail-stats-bar h3")[0].text.strip
        details[:route] = doc.css("div.mt-2#trail-stats-bar h3")[2].text.strip
        details[:high_elev] = doc.css("div.mt-2#trail-stats-bar h3")[3].css("span.imperial").text.strip
        details[:low_elev] = doc.css("div.mt-2#trail-stats-bar h3")[4].css("span.imperial").text.strip
        details[:elev_gain] = doc.css("div.mt-2#trail-stats-bar h3")[5].css("span.imperial").text.strip
        details[:dogs] = doc.css("div.main-content-container div.mb-1 h3.inline")[0].css("span.font-body").text.strip
        details
    end 
    

end 

# new = TrailDetailImporter.get_trail_details("https://www.hikingproject.com/trail/7000130/bear-peak-out-and-back")
# puts new 


