# frozen_string_literal: true

require 'sinatra/base'

module System
  class Server < Sinatra::Base
    project_root = File.join(root, '../public/')
    set :public_folder, project_root

    ['/'].each do |path|
      get path do
        File.read(File.join(project_root, 'index.html'))
      end
    end
  end
end
