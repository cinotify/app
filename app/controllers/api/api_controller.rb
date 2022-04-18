module Api
  class ApiController < ApplicationController
    skip_forgery_protection
    def notify
      if params[:to]&.match(/psnator/)
        return head 400
      end
      user = User.find_or_initialize_by(email: params[:to])
      user.save(validate: false)
      notification = user.notifications.create!(
        params.permit(:to,:subject,:body)
      )
      render json: notification
    end
  end
end
