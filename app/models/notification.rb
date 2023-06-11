# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :user
  after_create :deliver
  scope :recent, -> { order('created_at DESC').limit(10) }
  private

  def deliver
    content = SendGrid::Content.new(type: 'text/plain', value: body)
    mail = SendGrid::Mail.new(
      SendGrid::Email.new(email: 'app@cinotify.cc'),
      subject,
      SendGrid::Email.new(email: to),
      content
    )
    sg = SendGrid::API.new(api_key: Rails.application.credentials.sendgrid[:api_key])
    sg.client.mail._('send').post(request_body: mail.to_json)
  end

  def self.from_params(params)
    emails = params[:to].split(',')
    notifications = emails.map do |email|
      user = User.find_or_initialize_by(email:)
      user.save(validate: false)
      user.notifications.create!(
        { to: email.squish }.merge(params.permit(:subject, :body))
      )
    end
    if notifications.count == 1
      notifications[0]
    else
      notifications
    end
  end
end
