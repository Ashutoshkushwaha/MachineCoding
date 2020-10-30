# frozen_string_literal: true

require_relative 'expense.rb'

class ExactExpense < Expense
  def initialize(description, amount, paid_by, splits)
    super(description, amount, paid_by, splits)
  end

  protected

  def validate
    splits.each do |split|
      return false unless split.is_a?(ExactSplit)
    end

    sum = 0
    splits.each do |split|
      sum += split.amount.to_f
    end

    amount == sum
  end
end
