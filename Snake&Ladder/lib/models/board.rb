# frozen_string_literal: true

# Define this class as singleton class
class Board
  def initialize
    @start_num = 0
    @end_num = 100
    @snakes = {}
    @ladders = {}
  end

  attr_reader :snakes, :ladders

  def add_snakes(snakes)
    snakes.each do |snake|
      add_snake(snake.first, snake.last)
    end
  end

  def add_ladders(ladders)
    ladders.each do |ladder|
      add_ladder(ladder.first, ladder.last)
    end
  end

  def add_snake(start, ending)
    @snakes[start] = ending
  end

  def add_ladder(start, ending)
    @ladders[start] = ending
  end

  def final_position_for_step(current_position, step)
    final_position = current_position + step
    return current_position if final_position > @end_num

    while bit_by_snake?(final_position) || avail_ladder?(final_position)
      final_position = snakes[final_position] if bit_by_snake?(final_position)
      final_position = ladders[final_position] if avail_ladder?(final_position)
    end
    final_position
  end

  private

  def bit_by_snake?(position)
    snakes.key?(position)
  end

  def avail_ladder?(position)
    ladders.key?(position)
  end
end
