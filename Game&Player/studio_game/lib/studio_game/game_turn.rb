require_relative 'loaded_die'
module GameTurn 

	def self.roll_die
	  rand(1..6)
	end

   def self.take_turn(player)
   	# die = LoadedDie.new
       		number_rolled = roll_die
		case number_rolled
			when 1..2
			player.blam
			puts "#{player.name} blammed"

		    when 3..4
            puts "#{player.name} was skipped"
	        else
	   	    player.w00t
		    puts "#{player.name} w00ted!"
		    
		end
	end
end