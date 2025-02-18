# frozen_string_literal: true

require_relative '../rails_helper'
describe Category do
  describe 'validation' do
    let(:category) { build(:category) }

    it 'when category is valid' do
      expect(category.valid?).to be(true)
    end

    context 'when name invalid' do
      let(:category) { build(:category, name: '') }

      it 'raise error' do
        expect { category.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank")
      end
    end

    context 'when is general and without user' do
      let(:category) { build(:category, :general, user_id: nil) }

      it 'raise error' do
        expect { category.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: User can't be blank")
      end
    end
  end

  describe '.only_general' do
    let(:general) { create(:category, :general) }

    before { create(:category) }

    it 'returns expected categories' do
      expect(described_class.only_general).to eq([general])
    end
  end

  describe '.custom_for' do
    let(:user) { create(:user) }
    let(:category) { create(:category, user_id: user.id) }

    before { create(:category) }

    it 'returns expected categories' do
      expect(described_class.custom_for(user.id)).to eq([category])
    end
  end

  describe '.for' do
    let(:user) { create(:user) }
    let(:category) { create(:category, user_id: user.id) }
    let(:general) { create(:category, :general) }

    it 'returns expected categories' do
      expect(described_class.for(user.id)).to eq([general, category])
    end
  end
end
