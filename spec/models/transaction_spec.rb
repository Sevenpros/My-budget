require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'should be valid with valid attributes' do
    let(:user) { User.create(name: 'Name', email: 'a@mail.com', password: 'password') }
    let(:category) { user.categories.create(name: 'CATEGORY', icon: File.open('test/files/image.png', 'rb')) }
    let(:transaction) { user.transactions.create(name: 'food money', amouunt: 100, category:) }

    it 'should save the valid object' do
      expect(transaction).to be_valid
    end

    it 'should not save transaction without valid name' do
      transaction.name = nil
      expect(transaction).to_not be_valid
    end

    it 'should not save transaction without valid amount' do
      transaction.amouunt = nil
      expect(transaction).to_not be_valid
    end
  end
end
