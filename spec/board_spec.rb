# frozen_string_literal: true

require 'board'

RSpec.describe Board do
  subject(:board) { described_class.new }
  # let (:game) {instance_double("Game", :board => { "A" => { 1 => nil, 2 => nil, 3 => nil }, "B" => { 1 => nil, 2 => nil, 3 => nil}, "C" => { 1 => nil, 2 => nil, 3 => nil}} )}
  subject(:game) { Game.new('Bob', 'Jon', board) }

  context 'at the start of the game' do
    it 'the board has 12 empty fields' do
      expect(board.fields).to eq('A' => { 1 => nil, 2 => nil, 3 => nil }, 'B' => { 1 => nil, 2 => nil, 3 => nil }, 'C' => { 1 => nil, 2 => nil, 3 => nil })
    end
  end

  context 'when player1 takes a field' do
    it 'the value of the field becomes "X"' do
      # game = double('game')
      game.play('B2')
      # expect(game).to have_received(:play)
      expect(board.fields).to eq('A' => { 1 => nil, 2 => nil, 3 => nil }, 'B' => { 1 => nil, 2 => 'X', 3 => nil }, 'C' => { 1 => nil, 2 => nil, 3 => nil })
    end
  end

  context 'when player2 takes a field' do
    it 'the value of the field becomes "O"' do
      # allow(game).to receive(:play).with('B2')
      game.play('B2')
      expect(board.fields).to eq('A' => { 1 => nil, 2 => nil, 3 => nil }, 'B' => { 1 => nil, 2 => 'X', 3 => nil }, 'C' => { 1 => nil, 2 => nil, 3 => nil })
    end
  end

  # context 'when a field is taken' do
  #   it 'raises an error' do
  #     game.play('B2')
  #     expect
  #   end
end
