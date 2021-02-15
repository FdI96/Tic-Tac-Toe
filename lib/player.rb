require_relative 'board.rb'

class Player < Board
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def player_turn(board, turn)
    band = false
    band = select_slot(band, turn, board) until band
  end

  def select_slot(band, turn, board)
    puts 'Please select one empty space'
    board.updated_board
    number = gets.chomp.to_i
    if (1..9).include?(number)
      if board.board_array[number - 1] == 'X' || board.board_array[number - 1] == 'O'
        puts 'Slot occupied'
      else
        board.modify_board(number, turn)
        board.updated_board
        band = true
      end
    else
      puts 'No such position'
    end
    band
  end
end
