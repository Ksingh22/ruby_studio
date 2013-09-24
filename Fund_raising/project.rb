class Project
	attr_reader :initial_funding, :target_amount
    attr_accessor :name
	def initialize(name, initial_funding = 0, target_amount)
		@name = name.upcase
		@initial_funding = initial_funding
		@target_amount = target_amount
		@received_pledges = Hash.new(0)
	end

	def to_s
		"#{@name} has #{@initial_funding} towards a goal of #{@target_amount}"
		
	end
def add_fund
	@initial_funding + pledges
	puts "#{@name} got more funds!"
end
def remove_fund
	@initial_funding -=15
	puts "#{@name} lost some funds!"
end

def received_pledges(pledge)
	@received_pledges[pledge.name] =+ pledge.amount
   puts "#{name} received a #{pledge.name} pledge worth $#{pledge.amount}"	
end

def pledges
	@received_pledges.values.reduce(0, :+)
	
end
def total_funding
	@initial_funding + pledges
	
end

def <=>(other)
	other.initial_funding <=> initial_funding
	
end
 def fully_funded?
    total_funding <= 0
  
end
end


if __FILE__ == $0
project1 = Project.new('trip_overseas', 2000,5000)
project1.add_fund
puts project1

 puts project1.initial_funding
 puts project1.target_amount
 puts project1.total_funding 
 
 
# project name has been changed from trip overseas to ck
 project1.name = "ck"
 puts project1
 

puts "*************"
project2 = Project.new('cricket_tournament', 500, 2000)
project2.add_fund
puts project2

puts "*************"

project3 = Project.new('donation', 300, 1000)
project3.remove_fund
puts project3
puts "************"

project4 = Project.new('JV', 500, 6000)
project4.add_fund
puts project4

project4.name = "saab"
puts project4

puts "************"

puts project1.total_funding
puts project2.total_funding
puts project3.total_funding
puts project4.total_funding

projects = [project1, project2, project3, project4]
puts projects

projects.each do |project|
puts project.initial_funding
end

projects.each do |ck|
puts ck.add_fund
puts ck
end
projects.each do |remove|
puts remove.remove_fund
puts remove
end
end

