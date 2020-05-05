require_relative '../config/environment'

puts "Yo, what's your name? Let's shred."
name = gets.chomp.strip
greeting(name)
time = gets.chomp.strip
second_message(time)