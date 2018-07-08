require 'rails_helper'
require 'json'

describe 'POST /folders' do
  before { post '/folders', :params => { :folder => { :title => 'test' } }, headers: { 'Accept': 'application/json' } }

  it 'returns HTTP status 200' do
    expect(response).to have_http_status 201
  end

  it 'returns our folder' do
    expect("test").to eq JSON.parse(response.body)['title']
  end
end