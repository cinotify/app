require 'rails_helper'

RSpec.describe Notification do
  it "delivers messages" do
    stub_request(:post, "https://api.sendgrid.com/v3/mail/send").
    to_return(status: 200, body: "", headers: {})

    n = Notification.new(
      to: 'example@example.com',
      subject: 'hello',
      body: 'goodbye'
    )
    n.send(:deliver)
    # TODO test/track email sent successfully
  end
end