class Board
  attr_reader :board_array
  attr_reader :combination_array

  def initialize(board_array = [1, 2, 3, 4, 5, 6, 7, 8, 9], combination_array = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]])
    @board_array = board_array
    @combination_array = combination_array
  end
  
  def turn(turn, player_one, player_two)
    turn ? player_one : player_two
  end
  def updated_board
    puts "#{board_array[0]} | #{board_array[1]} | #{board_array[2]}"
    puts '-- --- --'
    puts "#{board_array[3]} | #{board_array[4]} | #{board_array[5]}"
    puts '-- --- --'
    puts "#{board_array[6]} | #{board_array[7]} | #{board_array[8]}"
  end

  def inside_array(sub_elem, number)
    sub_elem == number - 1 ? board_array[number - 1] : sub_elem
  end
  def modify_board(number, turn)
    board_array[number - 1] = turn ? 'X' : 'O'
    self.combination_array.map! { |elem| elem.map! { |sub_elem| inside_array(sub_elem, number) } }
  end

  def win_or_draw(accu, player)
    win = false
    combination_array.each { |elem| elem.all?('X') || elem.all?('O') ? win = true : false }
    if accu == 9
      puts 'No more plays available. Its a DRAW'
      false
    elsif win
      puts "Player #{player.name} WINS"
      false
    else
      true
    end
  end
end

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
