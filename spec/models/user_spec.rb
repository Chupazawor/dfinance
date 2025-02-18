# frozen_string_literal: true

require_relative '../rails_helper'
describe User do
  describe 'validations' do
    let(:user) { build(:user) }

    it 'when object is valid' do
      expect(user.valid?).to be(true)
    end

    context 'when first name invalid' do
      let(:user) { build(:user, first_name: 'q') }

      it 'raise error' do
        expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: First name is too short (minimum is 2 characters)')
      end
    end

    context 'when last name invalid' do
      let(:user) { build(:user, last_name: 'q') }

      it 'raise error' do
        expect do
          user.save!
        end.to raise_error(ActiveRecord::RecordInvalid,
                           'Validation failed: Last name is too short (minimum is 2 characters)')
      end
    end

    context 'when email invalid' do
      let(:user) { build(:user, email: 'q') }

      it 'raise error' do
        expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Email is invalid')
      end
    end

    context 'when email is already taken' do
      let(:user) { build(:user, email: 'test@example.com') }

      before { create(:user, email: 'test@example.com') }

      it 'raise error' do
        expect do
          user.save!
        end.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Email has already been taken')
      end
    end
  end
end
