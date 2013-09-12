class Dessert
	def initialize(name, calories)
		@name = name
		@calories = calories
	end
	
	#Setters
	def name=(name)
		@name = name
	end
	def calories=(calories)
		@calories = calories
	end

	#Getters
	def name
		@name
	end
	def calories
		@calories
	end

	def healthy?
		if(@calories < 200)
			return true
		else 
			return false
		end
	end

	def delicious?
		return true
	end
end

class JellyBean < Dessert
	def initialize(name, calories, flavor)
		@name = name
		@calories = calories
		@flavor = flavor
	end

	#Setters
	def name=(name)
		@name = name
	end
	def calories=(calories)
		@calories = calories
	end
	def flavor=(flavor)
		@flavor = flavor
	end
	
	#Getters
	def name
		@name
	end
	def calories
		@calories
	end
	def flavor
		@flavor
	end

	def delicious?
		if flavor.downcase == "black licorice"
			return false
		else
			return true
		end
	end
end

d1 = Dessert.new("mint", 150)
puts "Calories in a " + d1.name + ": " + d1.calories.to_s
puts d1.healthy?
puts d1.delicious?

j1 = JellyBean.new("black licorice", 201, "black licorice")
puts "Calories in a " + j1.name + " JellyBean: " + j1.calories.to_s
puts j1.healthy?
puts j1.delicious?