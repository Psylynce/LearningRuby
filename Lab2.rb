## Part 1: Hello World
class HelloWorldClass
	def initialize(name)
		@name = name.capitalize
	end
	def sayHi
		puts "Hello #{@name}!"
	end
end
puts "\n"
puts "This is the hello world output"
puts "\n"
hello = HelloWorldClass.new("Justin")
hello.sayHi

##Part 2

def palindrome?(string)
	#  Make string lowercase, take out whitespace and punctuation 
	#  then compare to the reverse
	fixed = string.downcase.scan(/\w/)
	fixed == fixed.reverse
end

puts "\n"
puts "This is the palindrome output"
puts "\n"
puts palindrome?("A man, a plan, a canal -- Panama")
puts palindrome?("Madam, I'm Adam!") 
puts palindrome?("Abracadabra") 

def count_words(string)
	# No for loops, use each
	# \b is a word boundry in ruby
	result = Hash.new(0)
	string.downcase.scan(/\w+/).map { |word| result[word] = string.downcase.scan(/\b#{word}\b/).size }
	return result
end

puts "\n"
puts "This is the word_count output"
puts "\n"
puts count_words("A man, a plan, a canal -- Panama")
puts count_words "Doo bee doo bee doo"

## Part 3
class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def check_play(play)
    if play == nil
    	return false
    elsif !play.is_a?(String)
    	return false
    elsif !play.downcase.match(/[rps]/)
    	return false
    else
    	return true
    end		
end

def rps_game_winner(game)
    raise WrongNumberOfPlayersError unless game.length == 2
    raise NoSuchStrategyError unless check_play(game[0][1]) && check_play(game[1][1])
    combos = ["rs", "sp", "pr", "rr", "ss", "pp"]
    return combos.index(game[0][1].downcase + game[1][1].downcase) ? game[0] : game[1]
end

def rps_tournament_winner(game)
	if !game[0][0].is_a?(String)
		return rps_tournament_winner([rps_tournament_winner(game[0]), rps_tournament_winner(game[1])])
	else
		return rps_game_winner(game)
	end
end
puts "\n"
puts " The winner of the RPS tournament is:"
p rps_tournament_winner([[[["Armando", "P"], ["Dave", "S"]], [["Richard", "R"], ["Michael", "S"]]], [[["Allen", "S"], ["Omer", "P"]], [["David E.", "R"], ["Richard X.", "P"]]]])


## Part 4
def combine_anagrams(words)
	# group the array by their keys values
	words.group_by { |word| word.chars.sort }.values
end
puts "\n"
puts "This is the anagram output"
puts "\n"
input = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
p combine_anagrams(input)