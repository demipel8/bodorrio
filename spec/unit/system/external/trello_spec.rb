# frozen_string_literal: true

require 'external/trello'

RSpec.describe 'trello' do
  it 'get checklists elements in a card' do
    ENV['TRELLO_BASE_URL'] = 'https://trello_api.com'
    ENV['TRELLO_KEY'] = 'a_key'
    ENV['TRELLO_TOKEN'] = 'a_token'

    trello = Trello.new

    stub_request(:get, 'https://trello_api.com/cards/a_card_id/checklists?key=a_key&token=a_token&checkItem_fields=name&fields=checkItems')
      .to_return(status: 200, body: FIXTURES.lunch_list_json)

    response = trello.checklists_in_card('a_card_id')

    expect(response).to eq(FIXTURES.lunch_list)
  end
end
