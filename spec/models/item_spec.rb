# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.describe Item, type: :model do
  let!(:owner) { create(:user) }
  let!(:name) { 'Gladiolus' }
  let!(:price) { 24 }

  subject do
    build(:item, name: name, owner: owner, price: price)
  end

  context 'when item is valid' do
    it 'is valid' do
      expect(subject.validate).to be true
    end
  end
  shared_examples :invalid_item do |error_key|
    it 'is not valid' do
      expect(subject.validate).to be false
      expect(subject.errors.keys).to include(error_key)
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
