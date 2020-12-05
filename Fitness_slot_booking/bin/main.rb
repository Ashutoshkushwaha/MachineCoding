# frozen_string_literal: true

put 'Welcome to fitness slot booking app'

require_relative '../lib/fitness_slot_booking.rb'

fitness_slot_booking = FitnessSlotBooking.new

fitness_slot_booking.add_user(User.new("u1", "ashu1@example.com", "Ashutosh1"))
fitness_slot_booking.add_user(User.new("u2", "ashu2@example.com", "Ashutosh2"))
fitness_slot_booking.add_user(User.new("u3", "ashu3@example.com", "Ashutosh3"))

# 