# frozen_string_literal: true

require_relative 'models/user.rb'
require_relative 'models/split.rb'
require_relative 'expense_handler.rb'

class Splitwise
  def initialize
    @users = [] # [{user_name: "Ashu", email: "abc@xyz.com"}]
    @expenses = []
    @users_ledger = {} # {user_name: { peer_user_name: amount }}
  end

  attr_reader :users, :expenses, :users_ledger

  def add_user(user)
    @users.push(user)
    @users_ledger[user.user_name] = {}
  end

  def add_expense(expense_type, description, amount, paid_by, splits)
    expense = ExpenseHandler.create_expense(expense_type, description, amount, paid_by, splits)
    expenses.push(expense)

    # Update users_ledger as per expenses
    splits.each do |split|
      paid_to = split.user
      user_ledger = users_ledger[paid_by]
      unless user_ledger.key?(paid_to.user_name)
        user_ledger[paid_to.user_name] = 0.0
      end
      user_ledger[paid_to.user_name] += split.amount
      user_ledger = users_ledger[paid_to]
      unless user_ledger.key?(paid_by.user_name)
        user_ledger[paid_by.user_name] = 0.0
      end
      user_ledger[paid_by.user_name] -= split.amount
    end
  end

  def show_balance_for(user_name)
    users_ledger[user_name].each do |peer_user_name, amount|
      print_balance(user_name, peer_user_name, amount)
    end

    puts "No balances for #{user_name}" if users_ledger[user_name].empty?
  end

  def show_all_balances
    all_blank = true
    users_ledger.each do |user_name, ledger|
      all_blank = false unless ledger.empty?
      ledger.each do |peer_user_name, amount|
        print_balance(user_name, peer_user_name, amount)
      end
    end

    puts 'No balances' if all_blank
  end

  private

  def print_balance(user_name, peer_user_name, amount)
    if amount.negative?
      puts "#{user_name} owes #{peer_user_name} : #{amount.abs}"
    else
      puts "#{peer_user_name} owes #{user_name} : #{amount}"
    end
  end
end
