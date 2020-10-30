# frozen_string_literal: true

class Player
  def initialize(name)
    @name = name
    @current_position = 0
  end

  attr_reader :name, :current_position

  def change_position_to(new_position)
    @current_position = new_position
  end

  def winner?
    @current_position == 100
  end
end
