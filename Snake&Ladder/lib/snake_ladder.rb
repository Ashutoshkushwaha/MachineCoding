# frozen_string_literal: true

# Snake and Ladder game
require_relative 'models/board.rb'
require_relative 'models/player.rb'
require_relative 'dice.rb'

class SnakeLadder
  def initialize
    @board = Board.new
    @players = []
    @game_ends = false
  end

  attr_reader :game_ends, :players, :board

  def add_board_snakes(snakes)
    board.add_snakes(snakes)
  end

  def add_board_ladders(ladders)
    board.add_ladders(ladders)
  end

  def add_players(players)
    @players = players
  end

  def start_game
    winning_player = nil
    until game_ends
      players.each do |player|
        roll_value = dice_roll_value
        player_current_position = player.current_position
        final_current_position = board.final_position_for_step(player_current_position, roll_value)
        player.change_position_to(final_current_position)
        puts "#{player.name} rolled a #{roll_value} and moved from #{player_current_position} to #{final_current_position}"
        next unless player.winner?

        @game_ends = true
        winning_player = player
        break
      end
    end
    puts "#{winning_player.name} wins the game"
  end

  def dice_roll_value
    Dice.roll
  end
end
