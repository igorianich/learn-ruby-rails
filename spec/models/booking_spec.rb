# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.describe Booking, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let!(:item) { create(:item) }
  let!(:user) { create(:user) }

  it 'Booking is not valid without change' do
    # booking = Booking.new
    expect(Booking.new).to_not be_valid
  end

  it 'Booking is not valid without Item' do
    booking = Booking.create(
      borrower: user, start_rent: DateTime.now, end_rent: DateTime.now.tomorrow
    )
    expect(booking.errors.messages.include?(:item)).to be_truthy
  end

  it 'Booking is not valid without borrower' do
    booking = Booking.create(
      item: item, start_rent: DateTime.now, end_rent: DateTime.now.tomorrow
    )
    expect(booking.errors.messages.include?(:borrower)).to be_truthy
  end

  it 'Booking is not valid without start rent' do
    booking = Booking.create(
      item: item, borrower: user, end_rent: DateTime.now.tomorrow
    )
    expect(booking.errors.messages.include?(:start_rent)).to be_truthy
  end

  it 'Booking is not valid without end rent' do
    booking = Booking.create(
      item: item, borrower: user, start_rent: DateTime.now
    )
    expect(booking.errors.messages.include?(:end_rent)).to be_truthy
  end

  it 'Booking is not valid without end rent' do
    booking = Booking.create(
      item: item, borrower: user, start_rent: DateTime.now.tomorrow,
      end_rent: DateTime.now
    )
    expect(booking.errors.messages.include?(:start_rent)).to be_truthy
  end
end
