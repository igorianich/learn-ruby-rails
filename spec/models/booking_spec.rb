# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe '#validate' do
    subject { booking.validate }

    let(:booking) do
      build(
        :booking,
        borrower: borrower, item: item, start_rent: start_rent,
        end_rent: end_rent
      )
    end
    let!(:item) { create(:item) }
    let!(:borrower) { create(:user) }
    let!(:start_rent) { Time.current }
    let!(:end_rent) { Time.current.tomorrow }

    context 'when booking is valid' do
      it 'is valid' do
        expect(subject).to be true
      end
    end

    shared_examples :invalid_booking do |error_key|
      it 'is not valid' do
        expect(subject).to be false
        expect(booking.errors.keys).to include(error_key)
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

    context 'when start rent older than ending of rent' do
      let(:start_rent) { 2.days.from_now }

      it_behaves_like :invalid_booking, :start_rent
    end
  end
end
