# frozen_string_literal: true

class User
  def initialize(id, email, full_name)
    @id = id
    @email = email
    @full_name = full_name
  end

  attr_reader :id, :email, :full_name
end
