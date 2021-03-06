class Ride < ActiveRecord::Base
    belongs_to :shredder
    belongs_to :trail

# set_time
def self.set_time
    puts "How fast would you guess that you did that run in? Just enter your best guess in seconds between 1 - 100."
    puts ""
    user_time_input = gets.chomp.strip.to_i
    unless user_time_input.between?(1, 100)
        puts ""
        self.set_time
    else
        puts ""
        puts ""
        sleep 2
        puts "Whoa, you shred that trail in #{user_time_input} seconds?! Sick bra. I've stored that time for you in the mountain's record book."
        puts ""
        puts ""
        self.last.update(time: user_time_input)
        sleep 5
    end
end

# see_leaderboard
def self.see_leaderboard
    puts ""
    puts ""
    unless Shredder.last.name == Ride.last.shredder.name
        puts "[If you had any rides, you'd be able to see the trail leaderboard for your last run here...]"
        puts ""
    else
        puts "Alright, so your time was #{self.last.time} seconds on your last run on #{self.last.trail.name}. Here's the leaderboard in seconds for that trail, that has a difficulty level of #{Ride.last.trail.difficulty}:"
        puts ""
        sleep 3
        rides = self.where(trail: self.last.trail)
        puts rides.map {|ride| [ride.time, ride.shredder.name]}.sort
        sleep 4
    end
    puts ""
    sleep 1
end

# delete_ride
def self.delete_ride
    puts ""
    puts ""
    unless Shredder.last.name == Ride.last.shredder.name
            puts "[If you had any rides, you'd be able to delete your last one here...Get some rides in yo!]"
    else
            puts "Yeah, we didn't want to put you on blast but that last run on #{self.last.trail.name} was pretty weak. We're deleting it from the mountain record book...slowpoke."
            self.last.destroy
    end
    puts ""
    puts ""
    sleep 3
end

end