# frozen_string_literal: true

class Invitees
  def initialize(name)
    @name = name
  end

  def lunch?
    lunch_invitee?
  end

  def party?
    party_invitee?
  end

  private

  def lunch_invitee?
    lunch_invitees = %w[a_family_member]
    lunch_invitees.include?(@name)
  end

  def party_invitee?
    party_invitees = %w[a_friend another_friend]
    party_invitees.include?(@name)
  end
end
