# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.describe Item, type: :model do
  let!(:user) { create(:user) }

  it 'Item is not valid without change' do
    # booking = Booking.new
    expect(Item.new).to_not be_valid
  end

  it 'Item is not valid without Owner' do
    item = Item.create(price: 6, name: 'Dusha')
      # owner: user, price: 6, name: 'Dusha'
    expect(item.errors.messages.include?(:owner)).to be_truthy
  end

  it 'Item is not valid without price' do
    item = Item.create(owner: user, name: 'Dusha')
    expect(item.errors.messages.include?(:price)).to be_truthy
  end

  it 'Item is not valid without name' do
    item = Item.create(owner: user, price: 6)
    expect(item.errors.messages.include?(:name)).to be_truthy
  end



end
