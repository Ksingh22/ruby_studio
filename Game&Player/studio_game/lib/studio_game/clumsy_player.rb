require_relative 'player'
module StudioGame
class ClumsyPlayer < Players

	# def found_treasure(treasure)
	# 	points = treasure.points / 2
	# 	@found_treasure[treasure.name] += points
 #   puts "#{@name} found a #{treasure.name} worth #{treasure.points} points"
	# end
def found_treasure(treasure)
		# points = treasure.points / 2
		# @found_treasure[treasure.name] += points
		damaged_treasure = Treasures.new(treasure.name, treasure.points / 2)
		super(damaged_treasure)
    	

end

if __FILE__ == $0
  clumsy = StudioGame::ClumsyPlayer.new("klutz")  
  
  hammer = Treasures.new(:hammer, 50)
  clumsy.found_treasure(hammer)
  clumsy.found_treasure(hammer)
  clumsy.found_treasure(hammer)
  
  crowbar = Treasures.new(:crowbar, 400)
  clumsy.found_treasure(crowbar)
  
  clumsy.each_found_treasure do |treasure|
    puts "#{treasure.points} total #{treasure.name} points"
  end
  puts "#{clumsy.points} grand total points"
end
end
end