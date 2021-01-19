# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#validate' do
    subject { item.validate }

    let(:item) { build(:item, name: name, owner: owner, price: price) }
    let!(:owner) { create(:user) }
    let!(:name) { 'Gladiolus' }
    let!(:price) { 24 }

    context 'when all fields are valid' do
      it 'is valid' do
        expect(subject).to be true
      end
    end

    shared_examples :invalid_item do |error_key|
      it 'is not valid' do
        expect(subject).to be false
        expect(item.errors.keys).to include(error_key)
      end
    end

    context 'when item does not have name' do
      let(:name) { nil }

      it_behaves_like :invalid_item, :name
    end

    context 'when item does not have owner' do
      let(:owner) { nil }

      it_behaves_like :invalid_item, :owner
    end

    context 'when item does not have price' do
      let(:price) { nil }

      it_behaves_like :invalid_item, :price
    end
  end
end
