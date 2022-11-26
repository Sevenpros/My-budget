require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User must have all attributes to be valid' do
    let(:user) { User.create(name: 'Name', email: 'a@mail.com', password: 'password') }

    it 'should be valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'should not be valid without name' do
      user.name = nil
      expect(user).to_not be_valid
    end
  end
end
