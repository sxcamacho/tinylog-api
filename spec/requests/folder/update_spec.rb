
require 'rails_helper'

describe 'PATCH /folders/:id' do
  let!(:new_folder) { FactoryGirl.create(:folder) }
  let!(:random_hash) { SecureRandom.urlsafe_base64 }

  before { patch '/folders/' + new_folder.uid, :params => {
    :folder => { :title => random_hash }
  }, headers: { 'Accept': 'application/json' } }

  it 'returns HTTP status 200' do
    expect(response).to have_http_status 201
  end

  it 'compare' do
    expect(random_hash).to eq JSON.parse(response.body)['title']
  end
end