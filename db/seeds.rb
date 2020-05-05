Shredder.delete_all
Trail.delete_all
Ride.delete_all

shredder1 = Shredder.create(name: "Mike", skill: 7)
shredder2 = Shredder.create(name: "Jerry", skill: 2) 
shredder3 = Shredder.create(name: "Dustin", skill: 9) 

trail1 = Trail.create(name: "Bottoms Up", difficulty: 8)
trail2 = Trail.create(name: "Cruise Control", difficulty: 5)
trail3 = Trail.create(name: "Training Wheels", difficulty: 2) 

ride1 = Ride.create(shredder: shredder1, trail: trail1, time: 72)
ride2 = Ride.create(shredder: shredder2, trail: trail2, time: 88)
ride3 = Ride.create(shredder: shredder3, trail: trail3, time: 76)
ride4 = Ride.create(shredder: shredder2, trail: trail3, time: 56)
ride5 = Ride.create(shredder: shredder3, trail: trail2, time: 67)