
require 'rails_helper'

RSpec.describe 'index page', type: :feature do
  describe 'root path' do
    fixtures :users
    it 'shows something' do
      visit root_path
      expect(page).to have_content('Notifications')
    end
    it 'lists notifications' do
      sign_in users(:alice)
      visit root_path
      expect(page).to have_content('No recent notifications')
    end
  end
end