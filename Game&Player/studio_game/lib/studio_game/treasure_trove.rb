module StudioGame
	Treasures = Struct.new(:name, :points)

	module TreasureTrove 
	# treasure = TreasureTrove::TREASURES
	TREASURES = [
		Treasures.new(:pie,         5),
		Treasures.new(:bottle,     25),
		Treasures.new(:hammer,     50),
		Treasures.new(:skillet,    100),
		Treasures.new(:broomstick, 200),
		Treasures.new(:crowbar,    400)
	]
	 def self.random
	 	TREASURES.sample
	 end

	end
	if __FILE__ == $0
	puts TreasureTrove::TREASURES
	treasure = TreasureTrove.random
	puts "Well done you have #{treasure.name} with #{treasure.points} points"

	end
end