# frozen_string_literal: true

require_relative 'expense_type.rb'
require_relative 'models/exact_expense.rb'
require_relative 'models/percent_expense.rb'
class ExpenseHandler
  def self.create_expense(expense_type, description, amount, paid_by, splits)
    case expense_type
    when ExpenseType::EXACT
      ExactExpense.new(description, amount, paid_by, splits)
    when ExpenseType::PERCENT
      splits.each do |split|
        split.modify_amount(amount * split.percent.fdiv(100))
      end
      PercentExpense.new(description, amount, paid_by, splits)
    else
      puts 'Invalid Expense type'
      nil
    end
  end
end
