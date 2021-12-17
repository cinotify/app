module Api
  class ApiController < ApplicationController
    skip_forgery_protection
    def notify
      user = User.find_or_initialize_by(email: params[:api][:to])
      user.save(validate: false)
      notification = user.notifications.create!(
        params.require(:api).permit(:to,:subject,:body)
      )
      render json: notification
    end
  end
end