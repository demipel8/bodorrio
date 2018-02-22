# frozen_string_literal: true

require 'services/invitees'

RSpec.describe 'invitees' do
  it 'tells if a person comes to lunch' do
    name = 'a_family_member'
    invitee = Invitees.new(name)

    expect(invitee.lunch?).to be true
  end

  it 'tells if a person comes to the party' do
    name = 'a_friend'
    invitee = Invitees.new(name)

    expect(invitee.party?).to be true
  end
end
