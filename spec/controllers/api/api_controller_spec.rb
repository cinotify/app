require 'rails_helper'

RSpec.describe Api::ApiController, type: :controller do
  it 'POSTs /notify with params' do
    expect_any_instance_of(Notification).to receive(:deliver)
    expect{
      post :notify, params:
        {
          to: 'example@example.com',
          subject: 'hello',
          body: 'goodbye'
        }
    }.to change{Notification.count}.by(1)
  end
  it 'rejects spammers' do
    post :notify, params:
      {
        to: 'admin@psnator.com',
        subject: 'hello',
        body: 'goodbye'
      }
    expect(response.code).to eq("400")
  end
end
