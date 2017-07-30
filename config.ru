# frozen_string_literal: true

require_relative 'system/server.rb'

map '/' do
  run System::Server
end
