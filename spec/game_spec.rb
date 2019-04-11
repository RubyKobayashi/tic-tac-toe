require 'game'

RSpec.describe Game do
  subject(:game) { described_class.new('Bob', 'Jon') }

  it 'has 2 players play' do
    expect(game.player1).to eq('Bob')
    expect(game.player2).to eq('Jon')
  end
end
