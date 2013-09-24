class Project
	attr_reader :initial_funding, :target_amount
    attr_accessor :name
	def initialize(name, initial_funding = 0, target_amount)
		@name = name.upcase
		@initial_funding = initial_funding
		@target_amount = target_amount
		
	end

	def to_s
		"#{@name} has #{@initial_funding} towards a goal of #{@target_amount}"
		
	end
def add_fund
	@initial_funding += 25	
	puts "#{@name} got more funds!"
end
def remove_fund
	@initial_funding -=15
	puts "#{@name} lost some funds!"
end
def total_funding
	@target_amount - @initial_funding
	
end

end

# class Fund_reuest
# 	attr_reader :title
# def initialize(title)
# 	@title = title
# 	@projects = []
	
# end
# def add_projects(a_project)
# 	@projects << a_project
	
# end
# def request_funding
# 	puts "There are #{@projects.size} projects that you could fund"
# 	@projects.each do|project|
# 	puts project
# 	end

# end
# end
# project1 = Project.new('savings_for_car', 5000,20000)
# project2 = Project.new('cricket_tournament', 1000, 2000)

# projects  = Fund_reuest.new("VC-Friendly Start-up Projects")
# puts projects.title
# projects.add_projects(project1)
# projects.add_projects(project2)
# projects.request_funding


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