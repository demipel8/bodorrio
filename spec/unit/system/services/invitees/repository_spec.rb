# frozen_string_literal: true

require 'services/invitees/repository'
require 'external/trello'

require_relative '../../../fixtures'

RSpec.describe 'invitees repository' do
  it 'gets the lunch invitees list' do
    ENV['TRELLO_LUNCH_CARD'] = 'lunch_card_id'

    repository = InviteesRepository.new(TrelloTest)

    expect(repository.lunch_list).to eq(lunch_list)
  end

  it 'gets the party invitees list' do
    ENV['TRELLO_PARTY_CARD'] = 'party_card_id'

    repository = InviteesRepository.new(TrelloTest)

    expect(repository.party_list).to eq(party_list)
  end

  def lunch_list
    %w[a_familiar another_familiar a_familiar_from_another_list]
  end

  def party_list
    %w[a_friend another_friend]
  end

  class TrelloTest < Trello
    def checklists_in_card(id)
      return FIXTURES.lunch_list if id == 'lunch_card_id'
      return FIXTURES.party_list if id == 'party_card_id'
    end
  end
end
