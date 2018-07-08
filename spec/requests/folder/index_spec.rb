
require 'rails_helper'

describe 'GET /folders' do
  let!(:folders) { FactoryGirl.create_list(:folder, 10) }

  before { get '/folders', headers: { 'Accept': 'application/json' } }

  it 'returns HTTP status 200' do
    expect(response).to have_http_status 200
  end

  it 'returns all folders' do
    body = JSON.parse(response.body)
    expect(body.size).to eq(10)
  end
end