# frozen_string_literal: true

class User
  def initialize(user_name, email)
    @user_name = user_name
    @email = email
  end

  attr_reader :user_name, :email
end
