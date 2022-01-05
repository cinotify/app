class ApplicationController < ActionController::Base
  def index
    if current_user
      @notifications = current_user.notifications.recent
    end
  end
end
