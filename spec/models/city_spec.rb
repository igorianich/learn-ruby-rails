# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.describe City, type: :model do
  describe '#validate' do
    let(:name) { 'Lviv' }
    let(:population) { 250_000 }
    let(:country) { 'Ukraine' }

    subject do
      build(:city, name: name, population: population, country: country)
    end

    context 'when city is valid' do
      it 'is valid' do
        expect(subject.validate).to be true
      end
    end
    shared_examples :invalid_city do |error_key|
      it 'is not valid' do
        expect(subject.validate).to be false
        expect(subject.errors.keys).to include(error_key)
      end
    end

    context 'when city does not have name' do
      let(:name) { nil }

      it_behaves_like :invalid_city, :name
    end

    context "when city's name is invalid" do
      let(:name) { 'L' }

      it_behaves_like :invalid_city, :name
    end

    context 'when city does not have population' do
      let(:population) { nil }

      it_behaves_like :invalid_city, :population
    end

    context 'when city does not have country' do
      let(:country) { nil }

      it_behaves_like :invalid_city, :country
    end
  end
end
#   it 'city is not valid without change' do
#     expect(City.new).to_not be_valid
#   end
#
#   it 'City is not valid without Name' do
#     city = City.create(population: 250_000, country: 'Ukraine')
#     expect(city.errors.messages.include?(:name)).to be_truthy
#   end
#
#   it 'City is not valid without Population' do
#     city = City.create(name: 'Kiev', country: 'Ukraine')
#     expect(city.errors.messages.include?(:population)).to be_truthy
#   end
#
#   it 'City is not valid without Country' do
#     city = City.create(name: 'Kiev', population: 250_000)
#     expect(city.errors.messages.include?(:country)).to be_truthy
#   end
# end
