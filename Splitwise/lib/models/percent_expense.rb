# frozen_string_literal: true

require_relative 'expense.rb'

class PercentExpense < Expense
  def initialize(description, amount, paid_by, splits)
    super(description, amount, paid_by, splits)
  end

  protected

  def validate; end
end
