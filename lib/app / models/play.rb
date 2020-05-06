def greeting
    user_name_input = gets.chomp.strip
    puts "What up, #{user_name_input}. Let's hit Trail 1 together. Saddle up and follow me. Remember to hit that stopwatch to track your time on this run."
end

def play
    ride
    get_time
    create_time
    delete_time
    ride
    get_time
    create_time
    see_leaderboard
    update_skill
    receive_trail
    continue
    over? ? play : nil
    puts "Peace!"
end

def continue
    puts "This has been fun! Do you want to continue shredding? Input Yes to continue or anything else to stop."
end

def over?
    user_continue_input = gets.chomp.strip
    user_continue_input == "Yes"
end

def ride
    puts "Dropping!"
    puts "|          |"
    puts " |        |"
    puts "  |      |"
    puts "   |    |"
    puts "    |  |"
    puts "Siiiick run."
end

def get_time 
    puts "How fast did you do that run in? Just enter the amount of seconds."
end

def create_time
    user_time_input = gets.chomp.strip
    puts "Whoa, you shred that trail in #{user_time_input} seconds?! Sick bra. Time created."
end

def delete_time
    puts "Consider that a free run, cause we're going to delete your time to see if you can do a bit better. Time deleted."
end

def see_leaderboard
    puts "Here's the leaderboard - #{Ride.first.time}."
end

def update_skill
    puts "Here's your skill but you'll be able to update it soon here too. #{Shredder.first.skill} out of 5."
end

def receive_trail
    puts "Based off of your skill of #{Shredder.first.skill} out of 5, we recommend you shred #{Trail.first.name}. Let's go!"
end

def trail1display
    puts "|    T1    |"
    puts " |        |"
    puts "  |      |"
    puts "   |    |"
    puts "    |  |"
end

def trail2display
    puts "|    T2    |"
    puts " |        |"
    puts "  |      |"
    puts "   |    |"
    puts "    |  |"
end

# def get_first_shredder_name
#     puts "#{Shredder.first.name}"
# end

# def valid_trail?(user_input)
#   number.between?(0,5)
# end

# CRUD Methods

def create_shredder_name(user_input)
    # shredder = Shredder.create
    # shredder.name = user_input
    # shredder.save
    attributes = {
        name: user_input,
        skill: 0
    }
    shredder = Shredder.create(attributes)
    shredder.save
end

def update_last_shredder_skill
    Shredder.last.update(skill: (Shredder.last.skill + 1))
end

def create_shredder_ride(user_input)
    attributes = {
        shredder: Shredder.last,
        trail: Trail.last,
        time: user_input
    }
    ride = Ride.create(attributes)
    ride.save
end

def display_ride_times_by_last_ride_trail
    rides = Ride.where(trail: Ride.last.trail.id)
    rides.map {|ride| ride.time}
end

def display_trails_by_difficulty(user_input)
    trails = Trail.where(difficulty: user_input)
    trails.map {|trail| trail.name}
end

def display_trails_by_skill
    trails = Trail.where(difficulty: Shredder.last.skill)
    trails.map {|trail| trail.name}
end

def delete_last_ride
    Ride.last.destroy
end