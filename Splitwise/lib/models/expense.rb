# frozen_string_literal: true

require_relative 'percent_split.rb'
require_relative 'exact_split.rb'

class Expense
  def initialize(description, amount, paid_by, splits)
    @description = description
    @amount = amount
    @paid_by = paid_by
    @splits = splits
  end

  attr_reader :amount, :paid_by, :splits
end
