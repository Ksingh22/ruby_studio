require_relative 'project'


describe Project do

	  before do
     # $stdout = StringIO.new
	  @initial_funding = 2000
    @target_funding  =  5000
    @project1 = Project.new('trip_overseas', @initial_funding, @target_funding)
  	end

	it "has an initial target funding amount" do
	    @project1.initial_funding.should == 2000
      end

    it "computes the total funding outstanding as the target funding amount minus the funding amount" do
       @project1.total_funding.should == (@target_funding - @initial_funding)
    end

   it "increases funds by 25 when funds are added" do
       @project1.add_fund
       @project1.initial_funding.should == (@initial_funding + 25)
       puts @project1
       end
it "decreases funds by 15 when funds are removed" do
       @project1.remove_fund
       @project1.initial_funding.should == (@initial_funding - 15)
       puts @project1
       end

    context "has a default value of 0 for funding amount" do 
    before do 
      @project1 = Project.new('trip_overseas', 5000)
    end
    it "has a initial fund of 0" do 
    @project1.initial_funding.should == 0
     end
    end
  end

  