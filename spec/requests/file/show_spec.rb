
require 'rails_helper'

describe 'GET /files/:id' do
  let!(:new_file) { FactoryBot.create(:file) }
  before { get '/files/' + new_file.uid, params: {}, headers: { 'Accept': 'application/json' } }

  it 'returns HTTP status 200' do
    expect(response).to have_http_status 200
  end

  it 'returns our files' do
    expect(JSON.parse(response.body)['id']).to eq new_file.uid
  end
end