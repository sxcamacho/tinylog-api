
require 'rails_helper'

describe 'DELETE /files/:id' do
  
  let!(:new_file) { FactoryBot.create(:file) }
  let!(:new_file_uid) { new_file.uid }
  
  before { delete '/files/' + new_file_uid, :params => {}, headers: { 'Accept': 'application/json' } }

  it 'returns HTTP status 200' do
    expect(response).to have_http_status 200
  end

  it 'returns HTTP status 404' do
    get '/files/' + new_file_uid, params: {}, headers: { 'Accept': 'application/json' }
    expect(response).to have_http_status 404
  end
end