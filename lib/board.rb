class Board
  attr_reader :board_array

  def initialize(board_array, combination_array)
    @board_array = board_array
    @combination_array = combination_array
  end

  def turn(turn, player_one, player_two)
    turn ? player_one.name : player_two.name
  end

  def inside_array(sub_elem, number)
    sub_elem == number - 1 ? board_array[number - 1] : sub_elem
  end

  def modify_board(number, turn)
    board_array[number - 1] = turn ? 'X' : 'O'
    @combination_array.map! { |elem| elem.map! { |sub_elem| inside_array(sub_elem, number) } }
    true
  end

  def win_or_draw(accu)
    win = false
    @combination_array.each { |elem| elem.all?('X') || elem.all?('O') ? win = true : false }
    win || accu == 9 ? false : true
  end

  def updated_board
    "    #{board_array[0]} | #{board_array[1]} | #{board_array[2]}
    -- --- --
    #{board_array[3]} | #{board_array[4]} | #{board_array[5]}
    -- --- --
    #{board_array[6]} | #{board_array[7]} | #{board_array[8]}"
  end
end
