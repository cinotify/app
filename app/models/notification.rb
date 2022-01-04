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
    response = sg.client.mail._('send').post(request_body: mail.to_json)
  end
end
