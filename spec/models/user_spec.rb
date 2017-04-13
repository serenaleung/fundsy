require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'requires an email' do
      # GIVEN: a new user object without an email
      u = User.new

      # WHEN: we invoke validations
      u.valid?

      # THEN: we get an error on the email field
      expect(u.errors.messages).to have_key(:email)
    end

    it 'requires a unique email' do
      # Given:
      s = FactoryGirl.create(:user)
      u = User.new email: s.email

      # User.create first_name: 'Tam',
      #             last_name: 'Kbeili',
      #             email: 'tam@codecore.ca',
      #             password: 'supersecret'
      # u = User.new email: 'tam@codecore.ca'

      # WHEN: We invoke validation
      u.valid?

      # THEN: We have an error on the `email` field
      expect(u.errors.messages).to have_key(:email)
    end

  end
end
