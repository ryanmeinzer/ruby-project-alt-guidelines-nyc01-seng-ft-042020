# Higher-level methods

def greet
    Shredder.create_shredder
end

def start
    display_trail
    Shredder.increase_skill
    Shredder.set_skill
end

def ride
    suggest_trails
    create_ride
    display_trail 
    Shredder.increase_skill
    Ride.set_time
end

def play
    show_menu
    continue
    over? ? nil : play
end

# Granular methods

# create_shredder
# in shredder class

# display_trail
# method put at bottom of play.rb for space efficiency

# increase_skill
# inside shredder class

# set_skill
# inside shredder class

# suggest_trails
def suggest_trails
    puts ""
    puts ""
    puts "Based off of your skill level of #{Shredder.last.skill}, we recommend you shred any of these trails next."
    puts ""
    puts ""
    puts "#{Trail.find_by(difficulty: Shredder.last.skill - 1).name} with a difficulty of #{Shredder.last.skill - 1}."
    puts "#{Trail.find_by(difficulty: Shredder.last.skill).name} with a difficulty of  #{Shredder.last.skill}"
    puts "#{Trail.find_by(difficulty: Shredder.last.skill + 1).name} with a difficulty of #{Shredder.last.skill + 1}"
    puts ""
    puts ""
    sleep 3
end

# create_ride
def create_ride
    puts "So, which one of them bad boyz would you like to shred?"
    puts ""
    puts ""
    puts "Enter #{Shredder.last.skill - 1} to shred #{Trail.find_by(difficulty: Shredder.last.skill - 1).name}."
    puts "Enter #{Shredder.last.skill} to shred #{Trail.find_by(difficulty: Shredder.last.skill).name}."
    puts "Enter #{Shredder.last.skill + 1} to shred #{Trail.find_by(difficulty: Shredder.last.skill + 1).name}."
    puts ""
    puts ""
    user_trail_input = gets.chomp.strip
    ride = Ride.create
    ride.trail_id = user_trail_input
    ride.shredder_id = Shredder.last.id
    ride.time = nil
    ride.save
    puts ""
    puts ""
    puts "Saddle up and follow me. Keep track of your time - this sesh counts!"
    sleep 2
end

# set_time
# inside ride class

# show_menu
def show_menu
    puts "Whatchya wanna do now yo?"
    puts ""
    puts ""
    puts "Enter 1 to see the leaderboard for the last run you did on #{Ride.last.trail.name}."
    puts "Enter 2 to delete your last ride on #{Ride.last.trail.name} of #{Ride.last.time} seconds."
    puts "Enter 3 to hit the slopes again for another sesh."
    puts "Enter 4 to reset your skill level of #{Shredder.last.skill}."
    puts "Enter 5 or anything else to quit. Then, go grab a fresh one at the mountain bar and spread your stoke."
    puts ""
    puts ""
    user_menu_input = gets.chomp.strip.to_i
    if user_menu_input == 1
        Ride.see_leaderboard
    elsif user_menu_input == 2
        Ride.delete_ride
    elsif user_menu_input == 3
        ride
    elsif user_menu_input == 4
        Shredder.set_skill
    else
        return
    end
    show_menu
end

# continue
def continue
    puts ""
    puts ""
    puts "You sure you wanna get outa here? Just enter Yes to quit or enter anything else to get back on those slopes."
    puts ""
    puts ""
end

# over?
def over?
    user_continue_input = gets.chomp.strip
    user_continue_input == "Yes" || user_continue_input == "yes" || user_continue_input == "Y" || user_continue_input == "y"
end

# see_leaderboard
# inside ride class

# delete_ride
# inside ride class

def display_trail
    puts ""
    puts ""
    sleep 1
    puts "Dropping!"
    sleep 2
    puts ""
    puts ""
    puts "|                              |"
    puts "|                              |"
    puts "|                              |"
    puts "|                              |"
    puts "|                              |"
    sleep 1
    puts " |                            |"
    puts "  |                          |"
    puts "   |                        |"
    puts "    |                      |"
    puts "     |                    |"
    puts "      |                    |"
    puts "       |                    |"
    sleep 1    
    puts "        |                   |"
    puts "        |                   |"
    puts "       |                   |"
    puts "      |                   |"
    puts "     |                   |"
    puts "      |                   |"
    puts "       |                   |"
    sleep 1
    puts "        |                 |"
    puts "         |               |"
    puts "          |             |"
    puts "           |           |"
    puts "            |         |"
    puts "             |       |"
    sleep 1
    puts "              |       |"
    puts "              |        |"
    puts "               |        |"
    puts "                |         |"
    puts "                 |          |"
    puts "                  |          |"
    sleep 1
    puts "                 |          |"    
    puts "                |          |"    
    puts "               |          |"    
    puts "              |          |"    
    puts "             |          |"    
    puts "            |          |"    
    puts "           |          |"                    
    puts "          |          |"
    sleep 1
    puts "         |          |"
    puts "         |          |"
    puts "          |          |"
    puts "           |          |"
    puts "            |        |"
    puts "           |        |"
    sleep 1
    puts "          |        |"
    puts "           |        |"
    puts "            |        |"
    puts "             |      |"
    puts "              |    |"
    puts "              |    |"     
    sleep 1   
    puts "             |    |"  
    puts "            |    |"  
    puts "            |    |"  
    puts "            |    |"  
    puts "            |    |"  
    puts "            |    |"  
    sleep 1
    puts "            |     |"  
    puts "            |      |"  
    puts "             |      |"  
    puts "             |       |"      
    puts "              |       |"  
    puts "              |        |"  
    sleep 1
    puts "             |        |"  
    puts "            |        |"   
    puts "            |        |"      
    puts "            |        |"  
    puts "            |        |"  
    puts "             |      |" 
    sleep 1
    puts "             |      |" 
    puts "             |      |" 
    puts "              |    |"  
    puts "              |    |"  
    puts "               |  |"  
    sleep 1
    puts ""
    puts ""
    puts "Siiiick run, #{Shredder.last.name}."
    puts ""
    puts ""
    sleep 1
end

# def display_trail_by_skill
#     Trail.find_by(difficulty: Shredder.last.skill).name
#     # trail = Trail.where(difficulty: Shredder.last.skill)
#     # puts trail.map {|trail| trail.name}
# end

# def update_ride_id_by_search(search, update)
#     search = Ride.find_by(shredder_id: search)
#     search.update(shredder_id: update)
# end

# def display_trails_by_difficulty
#     trails = Trail.where(difficulty: Shredder.last.skill)
#     trails.map {|trail| trail.name}
# end