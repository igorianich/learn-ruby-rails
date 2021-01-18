# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.describe City, type: :model do
  it 'city is not valid without change' do
    expect(City.new).to_not be_valid
  end

  it 'City is not valid without Name' do
    city = City.create(population: 250_000, country: 'Ukraine')
    expect(city.errors.messages.include?(:name)).to be_truthy
  end

  it 'City is not valid without Population' do
    city = City.create(name: 'Kiev', country: 'Ukraine')
    expect(city.errors.messages.include?(:population)).to be_truthy
  end

  it 'City is not valid without Country' do
    city = City.create(name: 'Kiev', population: 250_000)
    expect(city.errors.messages.include?(:country)).to be_truthy
  end
end
