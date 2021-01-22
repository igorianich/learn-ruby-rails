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
  describe '#by_city' do
    subject { described_class.by_city(city) }

    let(:city) { create(:city, name: 'Kiev') }
    let(:city2) { create(:city, name: 'Lviv') }
    let(:item) { create(:item, owner: user1) }
    let(:item2) { create(:item, owner: user2) }
    let(:user1) { create(:user, city: city) }
    let(:user2) { create(:user, city: city2) }

    context 'when city exists' do
      it 'show items from city Kiev' do
        expect(subject).to match_array([item])
      end
    end

    context 'when we have another city' do
      let(:user1) { create(:user, city: city2) }
      let(:user2) { create(:user, city: city) }

      it 'show items from city Kiev' do
        expect(subject).to match_array([item2])
      end
    end

    context 'when we have another city' do
      it 'show items from city Kiev' do
        expect(subject).to eq([])
      end
    end
  end
  describe '#by_options' do
    subject { described_class.by_options(options) }

    let(:filter1) { create(:filter) }
    let(:filter2) { create(:filter) }
    let(:option1) { create(:option, filter: filter1) }
    let(:option2) { create(:option, filter: filter2) }
    let(:option3) { create(:option, filter: filter1) }
    let(:option4) { create(:option, filter: filter2) }
    let!(:item1) { create(:item, options: [option1, option2]) }
    let!(:item2) { create(:item, options: [option3, option4]) }
    let(:options) { [option1, option2] }

    context 'when we have first set options' do
      it 'show items with this options' do
        expect(subject).to match_array(item1)
      end
    end

    context 'when we have second set options' do
      let(:options) { [option3, option4] }

      it 'show items with this options' do
        expect(subject).to match_array(item2)
      end
    end

    context 'when are not options' do
      let(:options) { [option1, option4] }

      it 'show items with this options' do
        expect(subject).to eq([])
      end
    end
  end

  describe '#by_name' do
    subject { described_class.by_name(test_name) }

    let(:test_name) { name }
    let(:name) { 'Traktor' }
    let!(:item) { create(:item, name: name) }

    context 'when test name is good' do
      it 'show item with this name' do
        expect(subject).to match_array(item)
      end
    end

    context 'when test name is bad' do
      let(:test_name) { 'Wrong name' }

      it 'show nothing' do
        expect(subject).to eq([])
      end
    end

    context 'when test name is not full' do
      let(:test_name) { 'Traktor' }

      it 'show item ' do
        expect(subject).to match_array(item)
      end
    end
  end
end
