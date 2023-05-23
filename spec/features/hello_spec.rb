
require 'rails_helper'

RSpec.describe 'index page', type: :feature do
  describe 'root path' do
    fixtures :users
    it 'shows recent notifications' do
      stub_request(:post, "https://api.sendgrid.com/v3/mail/send").
         to_return(status: 200, body: "", headers: {})
      Notification.create(user: users(:alice), to: 'example@example.com')
      sign_in users(:alice)
      visit root_path
      expect(page).to have_content('Recent Notifications')
    end
    it 'has a welcome state' do
      sign_in users(:alice)
      visit root_path
      expect(page).to have_content('Welcome!')
    end
  end
end
