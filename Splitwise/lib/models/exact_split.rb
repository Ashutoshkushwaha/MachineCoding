# frozen_string_literal: true

require_relative 'split.rb'

class ExactSplit < Split
  def initialize(user, amount)
    super(user)
    @amount = amount
  end
end
