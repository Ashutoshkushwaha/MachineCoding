# frozen_string_literal: true

class Split
  def initialize(user)
    @user = user
    @amount = nil
  end

  attr_reader :user_name, :amount

  def modify_amount(amount)
    @amount = amount
  end
end
