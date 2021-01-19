# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.describe Review, type: :model do

  let!(:owner) { create(:user) }
  let!(:borrower) { create(
    :user, first_name: 'Taras', last_name: 'Borovec', age: 22, city: city,
    ) }
  let!(:user3) { create(
    :user, first_name: 'Petro', last_name: 'Shkatula', age: 32, city: city,
    ) }
  let!(:item) { create(:item) }
  let!(:city) { create(:city) }
  let!(:reviewer) { borrower }
  let!(:reviewable) { item }
  let!(:text) { 'This is a good item' }
  let!(:booking) {
    create(:booking, borrower: borrower, item: item, start_rent: DateTime.now,
    end_rent: DateTime.now.tomorrow )
  }
  subject do
    build(:review, reviewer: reviewer, reviewable: reviewable, text: text)
  end

  context 'when review is valid' do
    it 'is valid' do
      expect(subject.validate).to be true
    end
  end
  shared_examples :invalid_review do |error_key|
    it 'is not valid' do
      expect(subject.validate).to be false
      expect(subject.errors.keys).to include(error_key)
    end
  end

  shared_examples :invalid_reviewer do |error_text|
    it 'is not valid' do
      expect(subject.validate).to be false
      expect(subject.errors[:reviewer][0]).to eq(error_text)
    end
  end

  context 'when review does not have reviewer' do
    let(:reviewer) { nil }

    it_behaves_like :invalid_review, :reviewer
  end

  context 'when review does not have reviewable object' do
    let(:reviewable) { nil }

    it_behaves_like :invalid_review, :reviewable
  end

  context 'when review does not have reviewable object' do
    let(:reviewer) { user3 }

    it_behaves_like :invalid_reviewer, 'don\'t have bookings'
  end

  context 'when review does not have reviewable object' do
    let(:reviewer) { user3 }
    let(:reviewable) { owner }
    it_behaves_like :invalid_reviewer, 'don\'t work with user'
  end
end
