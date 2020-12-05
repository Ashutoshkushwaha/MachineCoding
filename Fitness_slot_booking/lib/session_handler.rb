# frozen_string_literal: true

require_relative 'session_type.rb'
require_relative 'models/gym_session.rb'
require_relative 'models/dance_session.rb'
require_relative 'models/yoga_session.rb'

class SessionHandler
  def self.create_session(session_type, capacity, waiting_list_capacity, starts_at)
    case session_type
    when SessionType::GYM
      GymSession.new(capacity, waiting_list_capacity, starts_at)
    when SessionType::YOGA
      YogaSession.new(capacity, waiting_list_capacity, starts_at)
    when SessionType::DANCE
      DanceSession.new(capacity, waiting_list_capacity, starts_at)
    else
      puts 'invalid type... cannot create'
      nil
    end
  end

  def self.book_session(user, session) 
    session.add_user(user)
  end

  def self.cancel_session(user, session)
    
    
    if session.booking_confirmed?(user)

    end
  end
end
