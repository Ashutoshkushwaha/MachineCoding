# frozen_string_literal: true

require_relative 'split.rb'

class PercentSplit < Split
  def initialize(user, percent)
    super(user)
    @percent = percent
  end

  attr_reader :percent
end
