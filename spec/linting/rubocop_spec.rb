# frozen_string_literal: true

require 'rubocop'

RSpec.describe 'RuboCop linter' do
  it 'checks our code complies with our style guide' do
    config = ['--out', '/dev/null']
    rubocop = RuboCop::CLI.new

    offenses = rubocop.run(config)

    expect(offenses).to be_zero
  end
end
