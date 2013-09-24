require_relative 'game'

player4 = Players.new ("ron")
player5 = Players.new("javees")
player6 = Players.new("Shawn")

players = [player4, player5, player6]

# File.readlines("player.csv").each do |line|
#   name, health = line.split (',')
#   player = Players.new(name,health.to_i)
#   	puts player
# end

File.open("player_ranking.csv", "w") do |file|
	players.sort.each do |player|
		file.puts "#{player.name}, #{player.health}"

	end
end