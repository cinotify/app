# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::ApiController, type: :controller do
  before do
    stub_request(:post, %r{https://discord.com/(.*)})
      .to_return(status: 204, body: '', headers: {})
  end
  it 'POSTs /notify with params' do
    expect_any_instance_of(Notification).to receive(:deliver)
    expect do
      post :notify, params:
        {
          to: 'example@example.com',
          subject: 'hello',
          body: 'goodbye'
        }
    end.to change { Notification.count }.by(1)
  end
  it 'rejects spammers' do
    post :notify, params:
      {
        to: 'admin@psnator.com',
        subject: 'hello',
        body: 'goodbye'
      }
    expect(response.code).to eq('400')
  end
  it 'supports multiple recipients' do
    stub_request(:post, 'https://api.sendgrid.com/v3/mail/send')
      .with(
        body: '{"from":{"email":"app@cinotify.cc"},"subject":"hello","personalizations":[{"to":[{"email":"example@example.com"}]}],"content":[{"type":"text/plain","value":"hey there"}]}'
      )
      .to_return(status: 200, body: '[]', headers: {})
    stub_request(:post, 'https://api.sendgrid.com/v3/mail/send')
      .with(
        body: '{"from":{"email":"app@cinotify.cc"},"subject":"hello","personalizations":[{"to":[{"email":"example2@example.com"}]}],"content":[{"type":"text/plain","value":"hey there"}]}'
      )
      .to_return(status: 200, body: '[]', headers: {})
    expect do
      post :notify, params:
        {
          to: 'example@example.com,example2@example.com',
          subject: 'hello',
          body: 'hey there'
        }
    end.to change { Notification.count }.by(2)

    expect do
      post :notify, params:
        {
          to: 'example@example.com, example2@example.com',
          subject: 'hello',
          body: 'hey there'
        }
    end.to change { Notification.count }.by(2)
  end
  it 'supports attachments' do
    stub_request(:post, 'https://api.sendgrid.com/v3/mail/send')
      .with(
        body: '{"from":{"email":"app@cinotify.cc"},"subject":"hello w/ attachments","personalizations":[{"to":[{"email":"example@example.com"}]}],"content":[{"type":"text/plain","value":"Please see the attached file(s)"}],"attachments":[{"content":"VGhpcyBpcyBhIGZpbGUgdG8gYmUgYXR0YWNoZWQgdG8gYW4gZW1haWwuCg==","type":"text/plain","filename":"attachment.txt"}]}'
      )
      .to_return(status: 200, body: '[]', headers: {})
    expect do
      post :notify, params: {
        to: 'example@example.com',
        subject: 'hello w/ attachments',
        body: 'Please see the attached file(s)',
        attachments: [
          {
            content: Base64.strict_encode64(File.read("spec/fixtures/attachment.txt")),
            type: "text/plain",
            filename: "attachment.txt"
          }
        ]
      }
    end.to change { Notification.count }.by(1)
  end
end
