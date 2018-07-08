
require 'rails_helper'

describe 'GET /folders/:id' do
  let!(:new_folder) { FactoryGirl.create(:folder) }
  before { get '/folders/' + new_folder.uid, params: {}, headers: { 'Accept': 'application/json' } }

  it 'returns HTTP status 200' do
    expect(response).to have_http_status 200
  end

  it 'returns our folder' do
    expect(new_folder.uid).to eq JSON.parse(response.body)['uid']
  end
end