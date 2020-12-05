# frozen_string_literal: true

require_relative 'session.rb'
class GymSession < Session
  def initialize(capacity, waiting_list_capacity)
    super(capacity, waiting_list_capacity)
  end
end
