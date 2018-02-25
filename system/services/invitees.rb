# frozen_string_literal: true

require_relative 'invitees/repository'

class Invitees
  def initialize(name, repository=InviteesRepository)
    @repository = repository.new
    @name = name
  end

  def lunch?
    lunch_invitees.include?(@name)
  end

  def party?
    party_invitees.include?(@name)
  end

  private

  def lunch_invitees
    @repository.lunch_list
  end

  def party_invitees
    @repository.party_list
  end
end
