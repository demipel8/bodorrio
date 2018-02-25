# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'json'

class Trello
  def initialize
    @key = ENV['TRELLO_KEY']
    @token = ENV['TRELLO_TOKEN']
  end

  def checklists_in_card(id)
    url = "#{ENV['TRELLO_BASE_URL']}/cards/#{id}/checklists?key=#{@key}&token=#{@token}&checkItem_fields=name&fields=checkItems"
    response = request(url)

    parse(response)
  end

  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end

  def request(url)
    uri = URI(url)

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(uri)

    response = http.request(request)
    response.read_body
  end
end
