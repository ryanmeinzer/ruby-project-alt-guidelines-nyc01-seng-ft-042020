class Shredder < ActiveRecord::Base
    has_many :rides
    has_many :trails, through: :rides

# create_shredder
def self.create_shredder
    puts "Yo, what's your name? Let's shred."
    puts ""
    puts ""
    user_name_input = gets.chomp.strip
    puts ""
    puts ""
    sleep 1
    puts "What up, #{user_name_input}. Let's first hit the easiest trail together, it's called #{Trail.find_by(name: "Training Wheels").name}. Saddle up and follow me."
    shredder = self.create
    shredder.name = user_name_input
    shredder.skill = 0
    shredder.save
    puts ""
    puts ""
    sleep 5
end

# increase_skill
def self.increase_skill
    puts "Your skill level has been increased by a point to #{self.last.skill + 1}."
    self.last.update(skill: (self.last.skill + 1))
    puts ""
    puts ""
    sleep 3
end

# set_skill
def self.set_skill
    puts ""
    puts ""
    puts "Do you think you're above (or below) a skill level of #{self.last.skill}?! Just enter your skill level of a number from 1 (weakest) to 10 (dopest)."
    puts ""
    puts ""
    user_skill_input = gets.chomp.strip
    self.last.update(skill: user_skill_input)
    puts ""
    puts ""
    sleep 2
end

end 