# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let!(:city) { create(:city) }
  # city = City.create(name: 'Kiev', population: 250_000, country: 'Ukraine')

    it 'User is not valid without change' do
    expect(User.new).to_not be_valid
  end

  it 'User is not valid without First name' do
    user = User.create(
      last_name: 'Last name', age: 18, adress: 'st. Komunizma', city: city
    )
    expect(user.errors.messages.include?(:first_name)).to be_truthy
  end

  it 'User is not valid without Last name' do
    user = User.create(
      first_name: 'First name', age: 18, adress: 'st. Komunizma', city: city
    )
    expect(user.errors.messages.include?(:last_name)).to be_truthy
  end

  it 'User is not valid without age' do
    user = User.create(
      first_name: 'First name', last_name: 'Last name',
      age: 1, adress: 'st. Komunizma', city: city
    )
    expect(user.errors.messages.include?(:age)).to be_truthy
  end

  it 'User is not valid without Adress' do
    user = User.create(
      first_name: 'First name', last_name: 'Last name', age: 18,
      adress: 'st', city: city
    )
    expect(user.errors.messages.include?(:adress)).to be_truthy
  end

  it 'User is not valid without City' do
    user = User.create(
      first_name: 'First name', last_name: 'Last name',
      age: 18, adress: 'st. Komunizma'
    )
    expect(user.errors.messages.include?(:city)).to be_truthy
  end
end
