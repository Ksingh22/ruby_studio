module FundRounding

def self.roll_die
	rand(1..6)
	
end
def self.fund_on_move(project)
	number_rolled = roll_die
  	if number_rolled.odd?
   project.remove_fund
   puts project
  else
   project.add_fund
   puts project
  end
end
end