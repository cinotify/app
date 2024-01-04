# frozen_string_literal: true

module Api
  class ApiController < ApplicationController
    skip_forgery_protection
    def notify
      return head 400 if params[:to]&.match(/psnator/)

      begin
        @notification = Notification.from_params(params)
      rescue => e
         return render json: {error: e.message}, status: 400
      end
      render json: @notification
    end
  end
end
