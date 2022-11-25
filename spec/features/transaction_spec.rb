require 'rails_helper'

RSpec.describe 'Taransaction', type: :feature do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'Name', email: 'a@mail.com', password: 'password') }
  let(:category) { user.categories.create(name: 'CATEGORY', icon: File.open('test/files/image.png', 'rb')) }
  let(:transaction) { user.transactions.create(name: 'food money', amouunt: 100, user:, category:) }

  describe 'index page' do
    before(:each) do
      sign_in user
      visit "/categories/#{category.id}/transactions"
    end

    it 'I can see the transaction name ' do
      expect(page).to have_content 'Transaction'
    end
  
  end
end
