
## Is the interface for user interaction

class TrailSearcher

    attr_accessor :dist, :zip_code, :lat, :long, :city, :state 

    def initialize
    end

    def run
        puts "\nHello!"
        self.greeting
        self.prompt_and_display_trails
        self.get_trail_details
        self.exit_prompt
    end 

    def greeting
        puts "\nWhat is your name? "
        user_name = gets.chomp
        if user_name.match(/^[a-zA-z]+$/)
            print "\nWelcome, " + "#{user_name.capitalize}".colorize(:light_yellow) + "!"
            self.dot_delay(3, 0.5)
            print "to"
            self.dot_delay(3, 0.3)
            sleep 0.3
            print "the"
            self.dot_delay(5, 0.3)
            self.dot_delay(13, 0.04)
            4.times {puts "\n"}
            puts "********* " + "Hiking Trail CLI Application".colorize(:light_yellow) + " *********"
            puts "\nWith this application, you will be able to locate\n hiking trails anywhere in the United States.".colorize(:cyan)
            puts "\n************************************************"
            2.times {puts "\n"}
            sleep 1
        else 
            puts "\nYour input of '".colorize(:light_red) + "#{user_name}".colorize(:light_yellow) + "' is invalid. Please try again.".colorize(:light_red)
            self.greeting 
        end 
    end

    def prompt_and_display_trails
        puts "\nPlease enter the five digit zip code of where you would like to hike."
        @zip_code = gets.chomp
        if zip_code.match(/^\d{5}$/)
            results = Geocoder.search(zip_code)
            if results[0] != nil && results[0].data["address"]["city"] != nil
                @lat = results[0].data["lat"]
                @long = results[0].data["lon"]
                @city = results[0].data["address"]["city"]
                @state = results[0].data["address"]["state"]
                puts "\nYou entered zip code '" + "#{zip_code}".colorize(:light_yellow) + "' which is located in #{city}, #{state}."
                sleep 1
                self.prompt_distance_and_validate
            else 
                puts "\nThere is no record for zip code '".colorize(:light_red) + "#{zip_code}".colorize(:light_yellow) + "'.".colorize(:light_red)
                self.prompt_and_display_trails
            end 
        else 
            puts "\nYou entered '".colorize(:light_red) + "#{zip_code}".colorize(:light_yellow) + "' which is an invalid zip code.".colorize(:light_red)
            self.prompt_and_display_trails 
        end 
    end

    def get_trail_details
        puts "\nEnter the " + "number".colorize(:light_yellow) + " corresponding to the specific trail you would like to get more details about."
        trail_num = gets.chomp
        if (1..Trail.all.length).include?(trail_num.to_i)
            sorted_trails = Trail.all.sort {|a,b| a.length <=> b.length}
            puts "\nYou requested more details for" + " #{sorted_trails[trail_num.to_i - 1].name.upcase}".colorize(:light_yellow) + "..."
            sleep 1
            detail_hash = TrailDetailImporter.get_trail_details(sorted_trails[trail_num.to_i - 1].url)
            trail_detail = TrailDetails.new(detail_hash)
            self.list_trail_details(trail_detail)
        else
            puts "\nYou entered '".colorize(:light_red) + "#{trail_num}".colorize(:light_yellow) + "' which is not a valid choice.".colorize(:light_red)
            self.get_trail_details 
        end 
    end 

    def exit_prompt
        user_input = ""
        until user_input == "exit" || user_input == "2"
            puts "\n**********************************************"
            puts "\nEnter '" + "1".colorize(:light_yellow) + "' to go back to your list of trails."
            puts "Enter '" + "2".colorize(:light_yellow) + "' to enter a new zip code."
            puts "Enter '" + "exit".colorize(:light_yellow) + "' to close this application."
            user_input = gets.chomp
            if user_input == "1"
                puts "\nYou entered '" + "1".colorize(:light_yellow) + "'."
                puts "\n"
                self.list_trails 
                self.get_trail_details
                user_input = ""
            elsif user_input == "2"
                puts "\nYou entered '" + "2".colorize(:light_yellow) + "'."
                Trail.all.clear
                self.prompt_and_display_trails 
                self.get_trail_details
                user_input = ""
            elsif user_input != "exit"
                puts "\nYour input of '".colorize(:light_red) + "#{user_input}".colorize(:light_yellow) + "' is invalid! Please follow the instructions below:".colorize(:light_red)
            end 
        end
    end 

    def get_trails_from_lat_long(lat, long, dist)
        trails_array = TrailImporter.get_trails_by_lat_long(lat, long, dist)
        Trail.create_from_collection(trails_array)
        self.list_trails
    end

    def list_trails
        sorted_trails = Trail.all.sort {|a,b| a.length <=> b.length}
        sorted_trails.each_with_index do |trail, index|
            puts "#{index + 1}. ".colorize(:light_yellow) + "#{trail.name.upcase}".colorize(:cyan) + " -" + " Length: #{trail.length} mi".colorize(:cyan) + " - #{trail.summary}\n"
        end
    end 

    def list_trail_details(trail_detail)
        specific_trail = TrailDetails.all.detect {|trail| trail == trail_detail}
        2.times {puts "\n"}
        puts "**********************************************"
        puts "\nTrail Details for ".colorize(:cyan) + "#{specific_trail.name.upcase}".colorize(:light_yellow)
        puts "\nLength: ".colorize(:cyan) + "#{specific_trail.length} miles"
        puts "Level of Difficulty: ".colorize(:cyan) + "#{specific_trail.difficulty}"
        puts "Dogs Allowed?: ".colorize(:cyan) + "#{specific_trail.dogs}"
        puts "Route Type:".colorize(:cyan) + "#{specific_trail.route}"
        puts "Highest Elevation: ".colorize(:cyan) + "#{specific_trail.high_elev}"
        puts "Lowest Elevation: ".colorize(:cyan) + "#{specific_trail.low_elev}"
        puts "Elevation Gain: ".colorize(:cyan) + "#{specific_trail.elev_gain}"
        puts "\nDescription: ".colorize(:cyan) + "#{specific_trail.description}\n"
    end 

    def prompt_distance_and_validate
        self.prompt_distance 
        if TrailImporter.get_trails_by_lat_long(lat, long, dist)[0] != nil
            puts "Here are the trails available within " + "#{dist} miles".colorize(:light_yellow) + " of" + " #{city}, #{state} #{zip_code}".colorize(:light_yellow) + ":"
            puts "\n"
            self.get_trails_from_lat_long(lat, long, @dist)
        else 
            puts "There are no trails available within '".colorize(:light_red) + "#{dist}".colorize(:light_yellow) + "' miles of #{zip_code}. Please try again.".colorize(:light_red)
            self.prompt_distance_and_validate
        end 
    end 

    def prompt_distance
        puts "\nHow many miles from this location would you like to search for trails?\ (Enter a number between 1 and 100):"
        @dist = gets.chomp
            if (1..100).include?(dist.to_i) && dist.match(/^\d+$/)
                puts "\nYou entered '" + "#{dist}".colorize(:light_yellow) + "' miles.\n"
                sleep 1
                puts "\n"
            else
                puts "\nYou entered '".colorize(:light_red) + "#{dist}".colorize(:light_yellow) + "' miles which is invalid. Please try again.".colorize(:light_red)
                self.prompt_distance 
            end 
    end

    def dot_delay(times, delay)
        times.times do 
            sleep delay
            print "."
        end
    end 

end 