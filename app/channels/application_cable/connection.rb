module ApplicationCable
  class Connection < ActionCable::Connection::Base

    identified_by :notification_user

  end
end
