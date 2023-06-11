# frozen_string_literal: true

module Api
  class ApiController < ApplicationController
    skip_forgery_protection
    def notify
      return head 400 if params[:to]&.match(/psnator/)

      @notification = Notification.from_params(params)
      render json: @notification
    end
  end
end
