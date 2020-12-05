# frozen_string_literal: true

require_relative 'session.rb'
class YogaSession < Session
  def initialize(capacity, waiting_list_capacity)
    super(capacity, waiting_list_capacity)
  end
end
