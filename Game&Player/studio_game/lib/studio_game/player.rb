require_relative 'treasure_trove'
require_relative 'playable'

module StudioGame
	class Players
		include Playable
		attr_accessor :name, :health
		attr_reader  :score
	def initialize(name, health = 80)
		@name = name.capitalize
	    @health = health
	    @found_treasure = Hash.new(0)
	  
	end
	def to_s
	    "I'm #{@name} with a health of #{@health} and score of #{score}  (#{status})"
	    end
	def self.from_csv(line)
		   name, health = line.split(',')
		   Players.new(name, Integer(health))
	end
	    def to_csv
	    	"#{@name}, #{@health}"
	    	
	    end
	def points
		@found_treasure.values.reduce(0, :+)
	end
	    def found_treasure(treasure)
	    	@found_treasure[treasure.name] += treasure.points
	    	puts "#{@name} found a #{treasure.name} worth #{treasure.points} points"
	        puts "#{@name}'s treasures: #{@found_treasure}"
	   	    end

	def each_found_treasure 
		@found_treasure.each do |name,points|
			yield Treasures.new(name, points)
	end
	end
	def score
		 @health + points
	end

	def <=>(other)
		other.score <=> score
		
	end

	def status
		# stronger? ? "Famous" : "Not Famous"
		if stronger?
			"Famous"
		else
			"Not Famous"
		end
	 end
	end

	if __FILE__ == $0

	player1 = StudioGame::Players.new ("kamal")

	puts player1

	puts player1.blam

	puts player1

	end
end