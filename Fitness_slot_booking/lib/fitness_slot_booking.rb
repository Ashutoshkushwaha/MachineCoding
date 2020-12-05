# frozen_string_literal: true

require_relative 'session_handler.rb'
class FitnessSlotBooking
  def initialize
    @users = {} # {user_id: user}
    @users_sessions = {} # {user_id: {session: session, status: "active"}}
    @sessions = []
  end

  def add_user(user)
    @users[user.id] = user
  end

  def create_session(session_type, capacity, waiting_list_capacity, starts_at)
    session = SessionHandler.create_session(session_type, capacity, waiting_list_capacity, starts_at)
    @sessions.push(session)
  end

  def book_session(user_id, session)
    user = users[user_id]
    if SessionHandler.book_session(user, session)
      @users_sessions[user_id] = session
    end
  end

  def cancel_session_booking(user_id, session)
    user = users[user_id]
    if SessionHandler.book_session(user, session)
      # Mark the status of session as inactive
    end
  end
end
