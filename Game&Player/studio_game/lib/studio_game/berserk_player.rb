require_relative 'player'

module StudioGame
class BerserkPlayer < Players

def initialize(name, health =80 )
	super(name, health)
	@w00t_counts = 0
	
end
def berserk?
  @w00t_counts > 5
	
end
def w00t
	puts "#{@name} got w00ted!"
	super
	@w00t_counts +=1
	puts "#{@name} is berserk" if berserk?
end
def blam
	puts "\n"
	if berserk?
		w00t
	else
		super
	end

	
end
end
if __FILE = $0
berserker = StudioGame::BerserkPlayer.new( 'kamal')
puts berserker
4.times {berserker.w00t}
2.times {berserker.blam}
puts berserker
end
end