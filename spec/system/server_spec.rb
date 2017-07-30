# frozen_string_literal: true

require 'rack/test'
require 'server'

RSpec.describe 'Static files' do
  include Rack::Test::Methods

  def app
    System::Server
  end

  it 'returns html' do
    get '/'

    expect(last_response.ok?).to be
    expect(last_response.headers['Content-Type']).to eq('text/html;charset=utf-8')
    expect(last_response.headers['Content-Length'].to_i).to be > 0
  end
end
