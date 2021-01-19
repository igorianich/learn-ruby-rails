# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.describe Booking, type: :model do
  let!(:item) { create(:item) }
  let!(:borrower) { create(:user) }
  let!(:start_rent) { DateTime.now }
  let!(:end_rent) { DateTime.now.tomorrow }

  subject do
    build(
      :booking, borrower: borrower, item: item, start_rent: start_rent,
      end_rent: end_rent)
  end

  it 'Booking is not valid without change' do
    expect(Booking.new).to_not be_valid
  end

  context 'when booking is valid' do
    it 'is valid' do
      expect(subject.validate).to be true
    end
  end
  shared_examples :invalid_booking do |error_key|
    it 'is not valid' do
      expect(subject.validate).to be false
      expect(subject.errors.keys).to include(error_key)
    end
  end

  context 'when booking does not have item' do
    let(:item) { nil }

    it_behaves_like :invalid_booking, :item
  end

  context 'when booking does not have borrower' do
    let(:borrower) { nil }

    it_behaves_like :invalid_booking, :borrower
  end

  context 'when booking does not have start_rent' do
    let(:start_rent) { nil }

    it_behaves_like :invalid_booking, :start_rent
  end

  context 'when booking does not have end_rent' do
    let(:end_rent) { nil }

    it_behaves_like :invalid_booking, :end_rent
  end

  context 'when start rent older than end rent' do
    let(:start_rent) { DateTime.now.tomorrow }
    let(:end_rent) { DateTime.now }

    it_behaves_like :invalid_booking, :start_rent
  end
end
