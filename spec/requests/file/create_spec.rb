require 'rails_helper'
require 'json'

describe 'POST /files' do
  before { post '/files', :params => { :file => { :name => 'test' } }, headers: { 'Accept': 'application/json' } }

  it 'returns HTTP status 200' do
    expect(response).to have_http_status 201
  end

  it 'returns our folder' do
    expect("test").to eq JSON.parse(response.body)['name']
  end

  it 'chech created file' do
    file = create(:file, name: "test")
    expect("test").to eq file.name
  end  
end