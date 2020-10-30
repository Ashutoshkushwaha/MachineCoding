# frozen_string_literal: true

puts 'Hello.. Welcome to splitwise'

require_relative '../lib/splitwise.rb'

splitwise = Splitwise.new

splitwise.add_user(User.new('ashutosh', 'ashu@gmail.com'))
splitwise.add_user(User.new('umesh', 'ashu@gmail.com'))
splitwise.add_user(User.new('shubham', 'ashu@gmail.com'))
splitwise.add_user(User.new('ajit', 'ashu@gmail.com'))

splitwise.show_all_balances


splitwise.show_balance_for("ashutosh")