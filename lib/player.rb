require_relative 'board.rb'

class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def player_turn(board, turn)
    band = false
    band = select_slot(band, turn, board) until band
  end
end
