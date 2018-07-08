
require 'rails_helper'

describe 'DELETE /folders/:id' do
  let!(:new_folder) { FactoryGirl.create(:folder) }
  before { delete '/folders/' + new_folder.uid, :params => {}, headers: { 'Accept': 'application/json' } }

  it 'returns HTTP status 200' do
    expect(response).to have_http_status 200
  end

  it 'returns HTTP status 404' do
    get '/folders/' + new_folder.uid, params: {}, headers: { 'Accept': 'application/json' }
    expect(response).to have_http_status 404
  end
end