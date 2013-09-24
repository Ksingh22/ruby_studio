require_relative 'player'
require_relative 'game_turn'
require_relative 'treasure_trove'
require_relative 'clumsy_player'

module StudioGame
	class Game

	  attr_reader :title
	  def initialize(title)
	  @title = title
	  @players = []
	  end

	def add_player(a_player)
	@players << a_player
	end

	def print_name_and_health(player)
		puts "#{player.name} (#{player.health})"
	end
	def total_points
		@players.reduce(0){|sum, player|
			sum + player.points}
	end
	def load_players(from_file)
		File.readlines(from_file).each do |line|
		add_player(Players.from_csv(line))
	end

	def save
		 File.open("player_ranking.csv", "w") do |file|
	    @players.sort.each do |player|
	  	file.puts player.to_csv
	 end 	
	end
	end
		
	end
	def play(rounds)

	treasure = TreasureTrove::TREASURES
	puts "\nThere are #{treasure.size} treasures available"

	treasure.each do |treasure|
	puts "This #{treasure.name} has #{treasure.points} points"

	end
	puts "\nThere are #{@players.size} players in this #{@title} game"


	1.upto rounds do|count| 
		puts "\nRounds #{count}:" 
		@players.each do|player|
		GameTurn.take_turn(player)
		treasure = TreasureTrove.random
		player.found_treasure(treasure)
		# puts "#{player.name} got #{treasure.points} points led to treasure #{treasure.name}"
		puts player
		end
	  end

	end
	def game_status

		 famous_players = @players.select {|player| player.stronger?}
		 not_famous_players = @players.reject {|player| player.stronger?}


		# famous_players, not_famous_players = @player.partition { |e| e.stronger? }

	    puts "\n#{@title} Statistics:"

	     puts "\n#{total_points} Total points for player's"

	     @players.sort.each do |player|
	     	puts "\n#{player.name} total points:"
	     	 player.each_found_treasure do |treasure|
	    puts "#{treasure.points} total #{treasure.name} points"
	end
	     	puts "#{player.points} grand total points"
	     end
	      puts "\n#{famous_players.size} famous players:"
		 famous_players.each do |player|
		 print_name_and_health(player)

		end
	   puts "\n#{not_famous_players.size} non famous players:"
		not_famous_players.each do |player|
		print_name_and_health(player)
	end

	puts "\n#{@title} High Scores:"
	  @players.sort.each do |player|
	  formatted_name = player.name.ljust(20, '.')
	  puts "#{formatted_name} #{player.score}"
	end
	end

	end



	if __FILE__ == $0 
	player1 = Players.new("moe")
	clumsy_player = ClumsyPlayer.new("cK", 100)

	 kabaddi = StudioGame::Game.new("kabaddi")
	 puts kabaddi.title
	  default_player_file = File.join(File.dirname(__FILE__), 'player.csv')
	 kabaddi.load_players(ARGV.shift || default_player_file)
	 kabaddi.add_player(player1)
	 kabaddi.add_player(clumsy_player)
	 kabaddi.play(3) 
	 kabaddi.game_status
	 kabaddi.save

	end
end

