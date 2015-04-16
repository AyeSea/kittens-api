names = %w{Phoebe Cat Nutmeg Beyonce}

4.times do |n|
	name = names[n]
	age = 1 + rand(10)
	cuteness = 1 + rand(5)
	softness = 1 + rand(5)

	Kitten.create(name: 		name,
								age:  		age,
								cuteness: cuteness,
								softness: softness)
end