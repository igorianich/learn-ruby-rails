# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.resource 'Items' do
  let!(:item) { create(:item) }

  get '/items' do
    example_request 'getting a list of items' do
      items_hash = JSON.parse(response_body, symbolize_names: true)
      expect(items_hash[0][:id]).to eq(item.id)
      expect(items_hash[0][:name]).to eq(item.name)
      expect(items_hash[0][:price]).to eq(item.price)
      expect(status).to eq(200)
    end
  end

  post '/items' do
    with_options scope: :item do
      parameter :name, 'Name of item'
      parameter :price, 'Price of item'
    end

    let(:name) { 'Fake' }
    let(:price) { 5 }

    example 'creating a new item' do
      expect { do_request }.to change { Item.count }.by(1)
      item = Item.last
      expect(item.name).to eq(name)
      expect(item.price).to eq(price)
      expect(status).to eq(200)
    end
  end

  get '/items/:item_id' do
    let(:item_id) { item.id }

    example_request 'getting item by id' do
      item_hash = JSON.parse(response_body, symbolize_names: true)
      expect(item_hash[:id]).to eq(item.id)
      expect(item_hash[:name]).to eq(item.name)
      expect(item_hash[:price]).to eq(item.price)
      expect(status).to eq(200)
    end
  end

  patch '/items/:item_id' do
    let(:item_id) { item.id }

    with_options scope: :item do
      parameter :name, 'Name of item'
      parameter :price, 'Price of item'
    end

    let(:name) { 'Fake' }
    let(:price) { 5 }

    example_request 'updating the item' do
      expect(item.reload.name).to eq(name)
      expect(item.price).to eq(price)
      expect(status).to eq(200)
    end
  end

  delete '/items/:item_id' do
    let(:item_id) { item.id }

    example 'deleting the item' do
      expect { do_request }.to change { Item.count }.by(-1)
      expect(status).to eq(204)
    end
  end
end
