require_relative 'project'
require_relative 'fundrounding'
require_relative 'pledge_pool'

class Fund_request
	attr_reader :title
	
def initialize(title)
	@title = title
	@projects = []
	
end
def add_projects(a_project)
	@projects << a_project
	
end

def print_name_and_funding(project)
	puts "#{project.name} ($#{project.initial_funding})"
end

def request_funding(requests)
	pledge = PledgePool::PLEDGES
    puts "There are #{pledge.size} possible pleges amounts:"
    pledge.each do |pledge|
    puts "A #{pledge.name} is worth $#{pledge.amount}"
     end

	puts "\nThere are #{@projects.size} projects that you could fund"
    @projects.each do|project|
   # puts project
	end
     
	
	1.upto requests do |count|
	puts "\nFunding Request #{count}"  
    @projects.each do |project|
    	#FundRounding is module which contains the roll die method
  	FundRounding.fund_on_move(project)
  	pledge = PledgePool.random 
  	
  	puts "#{project.name} received a #{pledge.name} pledge worth #{pledge.amount}"

    end
end

end
	def funds_status
		fully_funded = @projects.select{|project| project.fully_funded?}
		under_funded = @projects.reject{|project| project.fully_funded?}
    
    puts "\n#{title} Statistics"

    puts "#{fully_funded.size} Fully-Funded Projects"
    fully_funded.each do |project|
    print_name_and_funding(project)
	end

	puts "#{under_funded.size} Under Funded Projects"
	under_funded.each do |project|
    print_name_and_funding(project)
end
 puts "\n#{@title} Funds:"
 @projects.sort.each do |project|
  formatted_name = project.name.ljust(20, '.')
  puts "#{formatted_name} #{project.initial_funding}"
end

end


end
 if __FILE__ == $0
project1 = Project.new('savings_for_car', 505)
 project2 = Project.new('cricket_tournament', 1000, 2000)


projects  = Fund_request.new("VC-Friendly Start-up Projects")
puts projects.title
projects.add_projects(project1)
projects.add_projects(project2)
projects.request_funding(2)
projects.funds_status

end
