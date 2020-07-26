require 'open-uri'
require 'nokogiri'
require 'pry'

## Scrapes data from specific trail page

class TrailDetailImporter

    def self.get_trail_details(trail_url)
        # trail_url = "https://www.hikingproject.com/trail/7000130/bear-peak-out-and-back"
        doc = Nokogiri::HTML(open(trail_url))
        details = {}

        doc.each do |i|
            details[:name] = i.css("div.row").css("h1").text
            details[:difficulty] = i.css("div.trail-subheader span.difficulty-text").text
            details[:overview] = i.css("div.main-content-container").css("div.mb-1")[3].text
            details[:description] = i.css("div.main-content-container").css("div.mb-1")[4].text
            details[:length] = i.css("div.mt-2#trail-stats-bar h3")[0].text
            details[:route] = i.css("div.mt-2#trail-stats-bar h3")[2].text
            details[:high_elev] = i.css("div.mt-2#trail-stats-bar h3")[3].css("span.imperial").text
            details[:low_elev] = i.css("div.mt-2#trail-stats-bar h3")[4].css("span.imperial").text
            details[:elev_gain] = i.css("div.mt-2#trail-stats-bar h3")[5].css("span.imperial").text
            details[:dogs] = i.css("div.main-content-container div.mb-1 h3.inline")[0].css("span.font-body").text
        end
        details
    end 

end 

# new = TrailDetailImporter.get_trail_details("https://www.hikingproject.com/trail/7000130/bear-peak-out-and-back")
# puts new 


