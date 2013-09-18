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

puts "\n"
puts "\n"

class Class
	def attr_accessor_with_history(attr_name)
		attr_name = attr_name.to_s
		attr_reader attr_name
		attr_reader attr_name+"_history"
		class_eval %Q{
			def #{attr_name}_history
				@#{attr_name}_history || [nil]
			end
			def #{attr_name}=(new_name)
				@#{attr_name}_history ||= [nil]
				@#{attr_name}_history << @#{attr_name} = new_name
			end
		}
	end
end

class Foo
	attr_accessor_with_history :bar
end

f1 = Foo.new
f1.bar = 2
f1.bar = "Foo-Bar"
f1.bar = 35
p f1.bar_history
puts "\n"
puts "\n"

class Numeric
	@@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
	def method_missing(method_id)
		singular_currency = method_id.to_s.gsub(/s$/, '')
		if @@currencies.has_key?(singular_currency)
			self * @@currencies[singular_currency]
		else
			super
		end
	end

	def in(currency)
		singular_currency = currency.to_s.gsub(/s$/, '')
		self / @@currencies[singular_currency]
	end
end

puts "\n"
p 1.dollar.in(:euro)
p 1.euro.in(:dollar)
p 10.euros.in(:rupees)

class String
	def palindrome?
		#  Make string lowercase, take out whitespace and punctuation 
		#  then compare to the reverse
		fixed = self.downcase.scan(/\w/)
		fixed == fixed.reverse
	end
end

puts "foo".palindrome?

module Enumerable
	def palindrome?
		p self.to_a == self.to_a.reverse
	end
end
[1,2,3,2,1].palindrome?

class CartesianProduct
	include Enumerable
	
	def initialize(x, y)
		@x = x
		@y = y		
	end

	def each
		return to_enum unless block_given?
		@x.each do |xi|
			@y.each {|yi| yield [xi, yi]}
		end		
	end
end

c = CartesianProduct.new([:a, :b], [4, 5, 6])
c.each { |elt| puts elt.inspect }
c1 = CartesianProduct.new([:a,:b], [])
c1.each { |elt| puts elt.inspect }