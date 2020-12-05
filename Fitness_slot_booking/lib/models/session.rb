# frozen_string_literal: true

require_relative 'user.rb'
class Session
  def initialize(capacity, waiting_list_capacity, starts_at)
    @capacity = capacity
    @waiting_list_capacity = waiting_list_capacity
    @starts_at = starts_at
    @users = []
    @waiting_list_user = []
  end

  attr_reader :capacity, :waiting_list_capacity, :waiting_list

  def add_user(user)
    if available?
      @users.push(user)
      true
    elsif waiting_list_available?
      @waiting_list_capacity.push(user)
      true
    else
      print 'No slots available'
      false
    end
  end

  def remove_user(user)
    @users.delete(user) 
  end

  def booking_confirmed?(user)
    @users.include?(user)
  end

  def booking_in_waiting_list?(user)
    @waiting_list_capacity.include?(user)
  end

  def first_in_waiting_list
    @waiting_list_user.shift
  end

  def available?
    users.size < capacity
  end

  def waiting_list_available?
    users_waiting_list.size < waiting_list_capacity
  end

  def eligible_for_removal?

  end
end
