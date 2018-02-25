# frozen_string_literal: true

require 'rack/test'
require 'server'

RSpec.describe 'Static files' do
  include Rack::Test::Methods

  def app
    System::Server
  end

  before do
    WebMock.allow_net_connect!
  end

  after do
    WebMock.disable_net_connect!
  end

  it 'returns html' do
    get '/'

    expect(last_response.ok?).to be
    expect(last_response.headers['Content-Type']).to eq('text/html;charset=utf-8')
    expect(last_response.headers['Content-Length'].to_i).to be > 0
  end

  it 'returns a lunch invitee its url' do
    post '/invitee', '{ "name": "a_family_member" }', 'CONTENT_TYPE' => 'application/json'

    expect(last_response.body).to eq('lunch_instructions.html')
  end

  it 'returns a party invitee its url' do
    post '/invitee', '{ "name": "a_friend" }', 'CONTENT_TYPE' => 'application/json'

    expect(last_response.body).to eq('party_instructions.html')
  end

  it 'returns a stranger its url' do
    post '/invitee', '{ "name": "a_stranger" }', 'CONTENT_TYPE' => 'application/json'

    expect(last_response.body).to eq('ftp_instructions.html')
  end
end
