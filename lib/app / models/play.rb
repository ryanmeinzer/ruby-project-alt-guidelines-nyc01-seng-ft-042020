def greeting
    user_name_input = gets.chomp.strip
    puts "What up, #{user_name_input}. Let's first hit the easiest trail together, it's called #{Trail.find_by(name: "Training Wheels").name}. Saddle up and follow me. Keep track of your time on this run."
    create_shredder_name(user_name_input)
end

def starter
    ride
    update_skill
    get_time
    create_ride
    delete_ride
end

def play
    ride
    update_skill
    get_time
    create_ride
    see_leaderboard
    receive_trail_suggestion
    continue
    over? ? play : nil
    puts "Peace!"
end

def ride
    puts "Dropping!"
    puts ""
    puts ""
    puts "|          |"
    puts " |        |"
    puts "  |      |"
    puts "   |    |"
    puts "    |  |"
    puts ""
    puts ""
    puts "Siiiick run, #{Shredder.last.name}."
end

def update_skill
    puts "Your skill has been increased by a point to #{Shredder.last.skill + 1}."
    update_last_shredder_skill
end

def get_time 
    puts "Btw, how fast would you guess that you did that run in? Just enter your best guess in seconds."
end

def create_ride
    user_time_input = gets.chomp.strip
    puts "Whoa, you shred that trail in #{user_time_input} seconds?! Sick bra. I've stored that time for you in the mountain's record book."
    create_shredder_ride(user_time_input)
end

def delete_ride
    puts "Actually, take back! You can do better. Consider that a free run, cause we're going to delete your time to give you another chance...slowpoke."
    delete_last_ride
end

def see_leaderboard
    puts "Alright, so your time was #{Ride.last.time} seconds on your last run on #{Ride.last.trail.name}. Here's the leaderboard in seconds for that trail:"
    display_ride_times_by_last_ride_trail
end

def receive_trail_suggestion
    puts "Based off of your skill of #{Shredder.last.skill} out of 5, we recommend you shred #{display_trail_by_skill} next. Let's go!"
end

def continue
    puts "This has been fun! Do you want to continue shredding? Input Yes to continue or anything else to stop."
end

def over?
    user_continue_input = gets.chomp.strip
    user_continue_input == "Yes" || user_continue_input == "yes" || user_continue_input == "Y" || user_continue_input == "y"
    # ((user_continue_input == "Yes") || (user_continue_input == "yes") || (user_continue_input == "Y") || (user_continue_input == "Y"))
end

# CRUD Methods

def create_shredder_name(user_name_input)
    # shredder = Shredder.create
    # shredder.name = user_input
    # shredder.save
    attributes = {
        name: user_name_input,
        skill: 0
    }
    shredder = Shredder.create(attributes)
    shredder.save
end

def update_last_shredder_skill
    Shredder.last.update(skill: (Shredder.last.skill + 1))
end

def create_shredder_ride(user_time_input)
    trailid = Shredder.last.skill == 1 ? 1 : Shredder.last.skill - 1
    attributes = {
        shredder: Shredder.last,
        trail_id: trailid,
        time: user_time_input
    }
    ride = Ride.create(attributes)
    ride.save
    # former method
    # trailid = Shredder.last.skill == 1 ? 1 : Shredder.last.skill - 1
    # attributes = {
    #     shredder: Shredder.last,
    #     trail: trailid,
    #     time: user_time_input
    # }
    # ride = Ride.create(attributes)
    # ride.save
end

def delete_last_ride
    Ride.last.destroy
end

def display_ride_times_by_last_ride_trail
    rides = Ride.where(trail: Ride.last.trail)
    puts rides.map {|ride| ride.time}.sort
end

def display_trail_by_skill
    Trail.find_by(difficulty: Shredder.last.skill).name
    # trail = Trail.where(difficulty: Shredder.last.skill)
    # puts trail.map {|trail| trail.name}
end

# def display_trails_by_difficulty
#     trails = Trail.where(difficulty: Shredder.last.skill)
#     trails.map {|trail| trail.name}
# end

# def trail1display
#     puts "|    T1    |"
#     puts " |        |"
#     puts "  |      |"
#     puts "   |    |"
#     puts "    |  |"
# end

# def trail2display
#     puts "|    T2    |"
#     puts " |        |"
#     puts "  |      |"
#     puts "   |    |"
#     puts "    |  |"
# end

# def valid_trail?(user_input)
#   number.between?(0,5)
# end