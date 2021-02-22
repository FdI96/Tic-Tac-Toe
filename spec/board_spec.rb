require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

CA = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
B = [1, 2, 3, 4, 5, 6, 7, 8, 9]

describe Board do
  describe '#turn' do
    it "return the player 1's name" do
      board = Board.new(B, CA)
      player_one = Player.new('FEDE')
      player_two = Player.new('FEDE2')
      expect(board.turn(true, player_one, player_two)).to eql('FEDE')
    end

    it "return the player 2's name" do
      board = Board.new(B, CA)
      player_one = Player.new('FEDE')
      player_two = Player.new('FEDE2')
      expect(board.turn(false, player_one, player_two)).to eql('FEDE2')
    end
  end
end
