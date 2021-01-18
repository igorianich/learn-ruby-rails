# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.describe Review, type: :model do

  let!(:user) { create(:user) }
  let!(:item) { create(:item) }
  let!(:city) { create(:city) }
  let!(:user2) { create(
    :user, first_name: 'Taras', last_name: 'Borovec', age: 22, city:city,
    ) }
  let!(:user3) { create(
    :user, first_name: 'Petro', last_name: 'Shkatula', age: 32, city:city,
    ) }
    let!(:booking) {
      create(:booking, borrower: user2, item: item, start_rent: DateTime.now,
      end_rent: DateTime.now.tomorrow   )
    }
    let!(:review) {
      create(:review, reviewer: user2, reviewable: item,
        text: 'This is a good item')
    }
  it "Review can't be empty" do
    expect(Review.new).to_not be_valid
  end

  it "Review can't be without Reviewer" do
    review = Review.create(
      reviewable: item, text: 'This is a good item'
    )
    expect(review.errors.messages.include?(:reviewer)).to be_truthy
  end

  it "Reviewer can't write review about item without booking" do
    review = Review.create(
      reviewer: user3, reviewable: item, text: 'This is a good item'
    )
    expect(review.errors.messages[:reviewer]).to eq(["don't have bookings"])
  end

  it "Reviewer can't write review about user without booking" do
    review = Review.create(
      reviewer: user3, reviewable: user, text: 'This is a good item'
    )
    expect(review.errors.messages[:reviewer]).to eq(["don't work with user"])
  end

end
