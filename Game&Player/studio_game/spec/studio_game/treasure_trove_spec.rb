require 'studio_game/treasure_trove'
require 'rspec'
   
   module StudioGame
describe Treasures do
  
  before do
    @treasure = Treasures.new(:hammer, 50)
  end
  
  it "has a name attribute" do
    @treasure.name.should == :hammer
  end
  
  it "has a points attribute" do
    @treasure.points.should == 50
  end
  
  describe TreasureTrove do
   it "has " do
   	treasure = TreasureTrove.random
    TreasureTrove::TREASURES.should include(treasure)
  end

end

end
end
