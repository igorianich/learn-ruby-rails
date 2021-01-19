# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  describe '#validate' do
    subject { review.validate }

    let(:owner) { create(:user) }
    let(:reviewer) { create(:user) }
    let!(:item) { create(:item, owner: owner) }
    let(:reviewable) { item }
    let(:text) { 'This is a good item' }
    let!(:booking) do
      create(
        :booking,
        borrower: reviewer, item: item, start_rent: DateTime.now,
        end_rent: DateTime.now.tomorrow
      )
    end
    let!(:review) do
      build(:review, reviewer: reviewer, reviewable: reviewable, text: text)
    end

    context 'when all field are valid' do
      context 'when reviewable is item' do
        it 'is valid' do
          expect(subject).to be true
        end
      end

      context 'when reviewable is user' do
        let(:reviewable) { owner }

        it 'is valid' do
          expect(subject).to be true
        end
      end
    end

    shared_examples :invalid_review do |error_key, error_text = nil|
      it 'is not valid' do
        expect(subject).to be false
        expect(review.errors.keys).to include(error_key)
        expect(review.errors[error_key][0]).to eq(error_text) if error_text
      end
    end

    context 'when review does not have reviewer' do
      let(:reviewer) { nil }
      let!(:booking) {}

      it_behaves_like :invalid_review, :reviewer
    end

    context 'when review does not have reviewable object' do
      let(:reviewable) { nil }

      it_behaves_like :invalid_review, :reviewable
    end

    context 'when review does not have reviewable object' do
      let!(:booking) {}

      it_behaves_like :invalid_review, :reviewer, 'don\'t have bookings'
    end

    context 'when review does not have reviewable object' do
      let(:reviewable) { owner }
      let!(:booking) {}

      it_behaves_like :invalid_review, :reviewer, 'don\'t work with user'
    end
  end
end
