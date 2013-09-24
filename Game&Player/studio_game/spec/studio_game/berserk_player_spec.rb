require 'studio_game/berserk_player'
# require 'rspec'
module StudioGame
describe BerserkPlayer do
	before do
	@inital_health = 50
     @player = BerserkPlayer.new("javees", @inital_health)
	end

	it "player goes berserk when w00ted more than 5 times" do
				6.times {@player.w00t}
				@player.berserk?.should be_true

	end

	it "player does not go berserk when w00ted up to 5 times" do
				5.times {@player.w00t}
				@player.berserk?.should be_false

	end
	it "gets w00ted instead of blammed when it's gone berserk" do
                 6.times {@player.w00t}
                 4.times {@player.blam}
				@player.berserk?.should be_true 

				 @player.health.should == @inital_health + (10 * 20 )
	end

end
end