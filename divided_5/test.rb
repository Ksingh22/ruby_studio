require_relative 'new_problem'
require 'rspec'

describe Division do

it "remainder should be zero after divided by 5" do
	  @remainder1 = Division.new(5,20)
     @remainder1.divisable_5.should == 0
	end
end


