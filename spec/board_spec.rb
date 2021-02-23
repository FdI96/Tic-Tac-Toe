require_relative '../lib/board'
require_relative '../lib/player'

describe Board do
  let(:ca) { [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] }
  let(:b) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }
  let(:testa) { [%w[X X X], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] }
  let(:testb) { [%w[X O X], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] }
  let(:board) { Board.new(b, ca) }
  let(:CONST) { [1, 2, 'X', 4, 5, 'O', 7, 8, 9].freeze }

  describe '#turn' do
    it "return the player 1's name" do
      player_one = Player.new('FEDE')
      player_two = Player.new('FEDE2')
      expect(board.turn(true, player_one, player_two)).to eql('FEDE')
    end

    it 'return false for not being the player one' do
      player_one = Player.new('FEDE')
      player_two = Player.new('FEDE2')
      expect(board.turn(false, player_one, player_two)).not_to eql('FEDE')
    end

    it "return the player 2's name" do
      player_one = Player.new('FEDE')
      player_two = Player.new('FEDE2')
      expect(board.turn(false, player_one, player_two)).to eql('FEDE2')
    end

    it 'return false for not being the player two' do
      player_one = Player.new('FEDE')
      player_two = Player.new('FEDE2')
      expect(board.turn(true, player_one, player_two)).not_to eql('FEDE2')
    end
  end

  describe '#inside_array' do
    it "return the user input - 1, if it's included in the smaller array" do
      expect(board.inside_array([0, 1, 2], 3)).to include 2
    end

    it "return false, if it's not included in the smaller array" do
      expect(board.inside_array([0, 1, 2], 3)).not_to include 3
    end
  end

  describe '#modify_board' do
    it 'return true if the selected number is available' do
      expect(board.modify_board(5, true)).to eql(true)
    end

    it "return false if the selected number isn't available" do
      expect(board.modify_board(4, true)).not_to eql(false)
    end
  end

  describe '#win_or_draw' do
    it 'returns false if the accu is equal to 9' do
      expect(board.win_or_draw(9)).to eql(false)
    end

    it "returns true if the accu isn't equal to 9" do
      expect(board.win_or_draw(5)).not_to eql(false)
    end

    it 'returns false if the player does a winning move' do
      board = Board.new(b, testa)
      expect(board.win_or_draw(5)).to eql(false)
    end

    it "returns true if there isn't a winning move or accu < 9" do
      board = Board.new(b, testb)
      expect(board.win_or_draw(3)).to eql(true)
    end
  end
end
