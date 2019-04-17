# frozen_string_literal: true

# require 'game'

RSpec.describe Game do
  subject(:game) { described_class.new('Bob', 'Jon', board) }
  let (:board) { instance_double('Board', fields: { 'A' => { 1 => nil, 2 => 'X', 3 => nil }, 'B' => { 1 => nil, 2 => nil, 3 => nil }, 'C' => { 1 => nil, 2 => nil, 3 => nil } }) }

  it '2 players play' do
    expect(game.player1).to eq('Bob')
    expect(game.player2).to eq('Jon')
  end

  # describe '#play' do

  it '#turn alternates between Player 1 and 2' do
    expect(game.turn).to eq('Bob')
    game.play('A1')
    expect(game.turn).to eq('Jon')
  end

  it '#registers moves' do
    game.play('A3')
    expect(board).to have_received(:fields).twice
  end

  context 'if the field is taken' do
    it 'raises an error' do
      game.play('B2')
      allow(board).to receive(:fields).and_return('A' => { 1 => nil, 2 => 'X', 3 => nil }, 'B' => { 1 => nil, 2 => 'O', 3 => nil }, 'C' => { 1 => nil, 2 => nil, 3 => nil })
      expect { game.play('B2') }.to raise_error('This field is already taken, please choose another one')
    end
  end
end
