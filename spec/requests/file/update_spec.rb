
require 'rails_helper'

describe 'PATCH /files/:id' do

  let!(:new_file) { FactoryBot.create(:file) }
  let!(:new_name) { Faker::App.name }

  before {
    patch "/files/#{new_file.uid}", :params => {
      :file => {
        :name => new_name
      }
    }, headers: { 'Accept': 'application/json' }
  }

  it 'returns HTTP status 201' do
    expect(response).to have_http_status 201
  end

  it 'compare' do
    expect(new_name).to eq JSON.parse(response.body)['name']
  end

end
