# frozen_string_literal: true

require 'services/invitees'
require 'services/invitees/repository'

RSpec.describe 'invitees' do
  it 'tells if a person comes to lunch' do
    name = 'a_familiar'
    invitee = Invitees.new(name, InviteesRepositoryTest)

    expect(invitee.lunch?).to be true
  end

  it 'tells if a person comes to the party' do
    name = 'a_friend'
    invitee = Invitees.new(name, InviteesRepositoryTest)

    expect(invitee.party?).to be true
  end

  class InviteesRepositoryTest < InviteesRepository
    def lunch_list
      %w[a_familiar another_familiar a_familiar_from_another_list]
    end

    def party_list
      %w[a_friend]
    end
  end
end
