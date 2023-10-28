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
    attachments.each do |a|
      attachment = SendGrid::Attachment.new
      attachment.content = a['content']
      attachment.filename = a['filename']
      attachment.type = a['type']
      mail.add_attachment(attachment)
    end
    sg = SendGrid::API.new(api_key: Rails.application.credentials.sendgrid[:api_key])
    sg.client.mail._('send').post(request_body: mail.to_json)
  end

  def self.from_params(params)
    emails = params[:to].split(',')
    notifications = emails.map do |email|
      user = User.find_or_initialize_by(email:)
      user.save(validate: false)
      notification_params = { to: email.squish }.merge(
        params.permit(:subject, :body, attachments: %i[
                        content
                        type
                        filename
                      ])
      )
      user.notifications.create!(notification_params)
    end
    if notifications.count == 1
      notifications[0]
    else
      notifications
    end
  end
end
