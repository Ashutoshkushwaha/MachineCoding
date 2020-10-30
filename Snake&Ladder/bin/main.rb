# frozen_string_literal: true

require_relative '../lib/snake_ladder.rb'

puts 'Hello.. Welcome to the Snake and Ladder'

# Take input for snakes
puts 'Enter the number of snakes'
num_of_snakes = gets.chomp.to_i
snakes = []
num_of_snakes.times do
  start, ending = gets.split.map(&:to_i)
  snakes.push([start, ending])
end

# Take input for ladders
puts 'Enter the number of ladders'
num_of_ladders = gets.chomp.to_i
ladders = []
num_of_ladders.times do
  start, ending = gets.split.map(&:to_i)
  ladders.push([start, ending])
end

# Take input for players
puts 'Enter the number of players'
number_of_players = gets.chomp.to_i
players = []
number_of_players.times do
  name = gets.chomp
  players.push(Player.new(name))
end

# ============ Start Snake and Ladder =============

snake_ladder = SnakeLadder.new

snake_ladder.add_board_snakes(snakes)
snake_ladder.add_board_ladders(ladders)
snake_ladder.add_players(players)

snake_ladder.start_game
