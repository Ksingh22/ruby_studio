# #unit_testing
require 'studio_game/player'

# require 'rspec'
module StudioGame
describe Players do

  before do
	# $stdout = StringIO.new 
	 
	@initial_health = 90
	@player1 = Players.new("moe", @initial_health)	
	
end


it "has capitalized name" do 
	@player1.name.should == "Moe"
  end

it "has an initial health" do
	 @player1.health.should == 90
end


 it "has a string representation" do 
 @player1.found_treasure(Treasures.new(:hammer, 50))
 @player1.found_treasure(Treasures.new(:hammer, 50))
 
 	 @player1.to_s.should == "I'm Moe with a health of 90 and score of 190  (Famous)"
 end

 it "computes a score as the sum of its health and points" do
    @player1.score.should == 90 
  end

it "increases health by 20 when w00ted" do
   	@player1.w00t
	@player1.health.should == (@initial_health + 20)
 end 

it "decreases health by 15 when blammed" do 
	@player1.blam
	@player1.health.should == (@initial_health - 15)
end 


it "computes a score as the sum of its health and points" do
 @player1.found_treasure(Treasures.new(:hammer, 50))
 @player1.found_treasure(Treasures.new(:hammer, 50))
 @player1.score.should == 190
end



context "created with a default health" do
before do
	@player1 = Players.new("moe")
end
it "has a initital health of 80" do
	@player1.health.should == 80
end
end

context "with a health of atleast 80" do
before do
@player1 = Players.new("moe", 80)
end
it "is stronger" do
# @player1.stronger?.should == true
 @player1.should be_stronger
 end

 it "has a famous status" do
 @player1.status.should == "Famous"
 end
end


context "with a health of less than 80" do
before do
@player1 = Players.new("moe", 60)
end
it "is not a stronger" do
# @player1.stronger?.should == false
@player1.should_not be_stronger
end
it "has not a famous status" do
 @player1.status.should == "Not Famous"
 end
end


end
end



