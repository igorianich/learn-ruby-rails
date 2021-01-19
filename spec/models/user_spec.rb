# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let!(:city) { create(:city) }
  let!(:first_name) { 'Petro' }
  let!(:last_name) { 'Tarasov' }
  let!(:age) { 21 }
  let!(:adress) { 'Zhopa mira' }
  # city = City.create(name: 'Kiev', population: 250_000, country: 'Ukraine')
  subject do
    build(
      :user, first_name: first_name, last_name: last_name, age: age,
      city: city, adress: adress
    )
  end

  context 'when user is valid' do
    it 'is valid' do
      expect(subject.validate).to be true
    end
  end
  shared_examples :invalid_user do |error_key|
    it 'is not valid' do
      expect(subject.validate).to be false
      expect(subject.errors.keys).to include(error_key)
    end
  end

  shared_examples :users_error do |error_key, error_text|
    it 'is not valid' do
      expect(subject.validate).to be false
      expect(subject.errors[error_key][0]).to eq(error_text)
    end
  end

  context 'when user does not have first name' do
    let(:first_name) { nil }

    it_behaves_like :invalid_user, :first_name
  end

  context 'when users first name is too short ' do
    let(:first_name) { 'd' }

    it_behaves_like :users_error, :first_name, 'is too short (minimum is 2 characters)'
  end

  context 'when user does not have first name' do
    let(:last_name) { nil }

    it_behaves_like :invalid_user, :last_name
  end

  context 'when users last name is too short' do
    let(:last_name) { 'd' }

    it_behaves_like :users_error, :last_name, 'is too short (minimum is 2 characters)'
  end

  context 'when user does not have age' do
    let(:age) { nil }

    it_behaves_like :invalid_user, :age
  end

  context 'when users age less than 18' do
    let(:age) { 17 }

    it_behaves_like :users_error, :age, 'must be greater than 17'
  end

  context 'when user does not have city' do
    let(:city) { nil }

    it_behaves_like :invalid_user, :city
  end
end
