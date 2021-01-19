# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City, type: :model do
  describe '#validate' do
    subject { city.validate }

    let(:city) do
      build(:city, name: name, population: population, country: country)
    end
    let(:name) { 'Lviv' }
    let(:population) { 250_000 }
    let(:country) { 'Ukraine' }

    context 'when all fields are valid' do
      it 'is valid' do
        expect(subject).to be true
      end
    end

    shared_examples :invalid_city do |error_key|
      it 'is not valid' do
        expect(subject).to be false
        expect(city.errors.keys).to include(error_key)
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

    context "when city's population is invalid" do
      let(:population) { '1k' }

      it_behaves_like :invalid_city, :population
    end

    context 'when city does not have country' do
      let(:country) { nil }

      it_behaves_like :invalid_city, :country
    end
  end
end
