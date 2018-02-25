# frozen_string_literal: true

require_relative '../../external/trello'

class InviteesRepository
  def initialize(trello=Trello)
    @trello = trello.new
  end

  def lunch_list
    checklists = @trello.checklists_in_card(ENV['TRELLO_LUNCH_CARD'])

    invitees_from(checklists)
  end

  def party_list
    checklists = @trello.checklists_in_card(ENV['TRELLO_PARTY_CARD'])

    invitees_from(checklists)
  end

  private

  def invitees_from(lists)
    lists.map { |list| names_from(list) }.flatten
  end

  def names_from(list)
    list[:checkItems].map { |item| item[:name] }.flatten
  end
end
