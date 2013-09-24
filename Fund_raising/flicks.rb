require_relative  'project'
require_relative  'fund_request'

# project1 = Project.new('savings_for_car', 505)
# project2 = Project.new('cricket_tournament', 1000, 2000)
# project3 = Project.new('jhona', 1000, 2000)
# project4 = Project.new('gardening', 1000, 2000)
# project5 = Project.new('planting', 1000, 2000)
project6 = Project.new('hair transplant',0, 1000)


projects  = Fund_request.new("VC-Friendly Start-up Projects")
puts projects.title
# projects.add_projects(project1)
# projects.add_projects(project2)
# projects.add_projects(project3)
# projects.add_projects(project4)
# projects.add_projects(project5)
projects.add_projects(project6)
projects.request_funding(2)

