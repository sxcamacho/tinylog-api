
require 'rails_helper'

describe 'GET /files' do
  let!(:files) { FactoryBot.create_list(:file, 10) }

  before { get '/files', headers: { 'Accept': 'application/json' } }

  it 'returns HTTP status 200' do
    expect(response).to have_http_status 200
  end

  it 'returns all files' do
    body = JSON.parse(response.body)
    expect(body.size).to eq(10)
  end
end