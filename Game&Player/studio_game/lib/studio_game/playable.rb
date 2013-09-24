module StudioGame
	module Playable
def blam
		self.health -=15
	# puts "#{@name} blammed!"
end
def w00t
	self.health += 20
	 # puts "#{@name}  w00ted!"
end

def stronger?
	self.health >= 80
end
end
end