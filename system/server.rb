# frozen_string_literal: true

require 'sinatra/base'
require 'json'
require_relative 'services/invitees'

module System
  class Server < Sinatra::Base
    project_root = File.join(root, '../public/')
    set :public_folder, project_root

    ['/'].each do |path|
      get path do
        File.read(File.join(project_root, 'index.html'))
      end
    end

    post '/invitee' do
      parameters = JSON.parse(request.body.read, symbolize_names: true)
      name = parameters[:name]
      return 'lunch_instructions.html' if Invitees.new(name).lunch?
      return 'party_instructions.html' if Invitees.new(name).party?
      'ftp_instructions.html'
    end
  end
end
