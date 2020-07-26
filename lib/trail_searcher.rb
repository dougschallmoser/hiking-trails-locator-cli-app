## Is the interface for user interaction

class TrailSearcher

    def initialize
    end

    def run
        self.greeting 
        puts "\nTo begin, please enter the five digit zip code of where you would like to hike."
        sleep 1
        zip_code = gets.chomp
        results = Geocoder.search(zip_code)
        lat = results[0].data["lat"]
        long = results[0].data["lon"]
        TrailImporter.get_trails_by_lat_long(lat, long)
    end 

    def greeting
        sleep 0.5
        puts "\nHello!"
        sleep 2
        puts "\nWhat is your name? "
        user_name = gets.chomp
        sleep 1
        print "\nWelcome, #{user_name}!"
        sleep 2
        3.times do
            sleep 0.5
            print "."
        end
        print "to"
        3.times do
            sleep 0.5
            print "."
        end
        sleep 0.5
        print "the"
        5.times do
            sleep 0.5
            print "."
        end 
        25.times do 
            sleep 0.04
            print "."
        end
        sleep 1
        puts "\n"
        puts "\n"
        puts "******** Hiking Trail CLI Application ********"
        sleep 4
        puts "\nWith this application, you will be able to locate hiking trails anywhere in the United States."
        sleep 4
        puts "\nWe will retrieve trails for you that are within a 20 mile radius of the zip code you provide to us."
        puts "\n**********************************************"
        sleep 4
    end



end 