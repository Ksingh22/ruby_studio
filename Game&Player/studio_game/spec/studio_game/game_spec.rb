require 'studio_game/game'
 # require 'player'
# require 'rspec'

module StudioGame
	describe Game  do  
		before do
	    @kabaddi = Game.new("kabaddi")
		end
	 context "being played with one player" do
	 before do
	 @initial_health = 80
	 @player1 = Players.new("moe", @initial_health)
	 @player2 = Players.new("larry", @initial_health)
	 @kabaddi.add_player(@player1)
	 @kabaddi.add_player(@player2)
	 end

	it "give the player a woot if a higher number is rolled" do
		GameTurn.stub(:roll_die).and_return(5)
		@kabaddi.play(1)
		@player1.health.should == @initial_health + 20

	end

	it "skip the player if a medium number is rolled" do
		 GameTurn.stub(:roll_die).and_return(3)
		@kabaddi.play(1)
		@player1.health.should == @initial_health 
		end 

	it "give the player a blam if a lower number is rolled" do
		 GameTurn.stub(:roll_die).and_return(2)
		@kabaddi.play(1)
		@player1.health.should == @initial_health - 15

	end
	it "computes total prints as the sum of all players points" do
	@player1.found_treasure(Treasures.new(:hammer, 50))
	@player2.found_treasure(Treasures.new(:crowbar, 400))

	@kabaddi.total_points.should == 450
	end



	end
	it "assigns a treasure" do

	game = Game.new("testing")
	player = Players.new("yes")
	game.add_player(player)
	game.play(1)
	player.points.should_not be_zero
	end
	end
end