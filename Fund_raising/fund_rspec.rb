require_relative 'fund_request'
require 'rspec'

describe Fund_request do
	 before do
      @project_for_car = Fund_request.new("new_car")
      @project_for_holidays = Fund_request.new("holidas in india")
	  end

context "fund for new car project" do
before do
     @initial_funding = 700
     @target_funding = 15000
     @project2 = Project.new("saving_for_car", @initial_funding, @target_funding)
     @project_for_car.add_projects(@project2)
   end

   it "add funds if even number is rolled" do
   	FundRounding.stub(:roll_die).and_return(4)
   	@project_for_car.request_funding(1)
   	@project2.initial_funding.should == @initial_funding + 505

   end


     it "remove funds if odd number is rolled" do
    FundRounding.stub(:roll_die).and_return(3)
     @project_for_car.request_funding(1)
   	 @project2.initial_funding.should == @initial_funding - 15
	end
  end

context "funds for trip to India"
before do
@initial_funding = 0
@target_funding = 10000
@holidays = Project.new("fun in Punjab", @initial_funding, @target_funding)
@project_for_holidays.add_projects(@holidays)
 end

it "add funds if even number is rolled" do
    FundRounding.stub(:roll_die).and_return(2)
    @project_for_holidays.request_funding(1)
    @holidays.initial_funding.should == @initial_funding + 505
end

it "loose funds if odd number is rolled" do
  FundRounding.stub(:roll_die).and_return(3)
  @project_for_holidays.request_funding(1)
  @holidays.initial_funding.should == @initial_funding - 15

end
end
