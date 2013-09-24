require 'studio_game/clumsy_player'


module StudioGame
describe ClumsyPlayer do 
	before do
		@player = ClumsyPlayer.new("Klutz")
	end


it "ClumsyPlayer only gets half the point value for each treasure" do
	hammer = Treasures.new(:hammer, 50)
	@player.found_treasure(hammer)
	@player.found_treasure(hammer)
	@player.found_treasure(hammer)
	@player.points.should == 75
end
end
end