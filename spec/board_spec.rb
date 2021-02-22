require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

CA = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
B = [1, 2, 3, 4, 5, 6, 7, 8, 9]
board = Board.new(B, CA)

describe Board do
  describe '#turn' do
    it "return the player 1's name" do
      player_one = Player.new('FEDE')
      player_two = Player.new('FEDE2')
      expect(board.turn(true, player_one, player_two)).to eql('FEDE')
    end

    it "return the player 2's name" do
      player_one = Player.new('FEDE')
      player_two = Player.new('FEDE2')
      expect(board.turn(false, player_one, player_two)).to eql('FEDE2')
    end
  end
  
  describe '#inside_array' do
    it "return the user input - 1, if it's included in the smaller array" do
      expect(board.inside_array([0, 1, 2], 3)).to include 2
    end
  end
  
  describe '#modify_board' do
    it "return true if the selected number is available" do
      B = [1, 2, 'X', 4, 5, 'O', 7, 8, 9]
      expect(board.modify_board(5, true)).to eql(true)
    end
  end
end
