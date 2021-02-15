class Board
  attr_reader :board_array
  attr_reader :combination_array

  def initialize(board_array, combination_array)
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
    combination_array.map! { |elem| elem.map! { |sub_elem| inside_array(sub_elem, number) } }
  end

  def win_or_draw(accu, player)
    win = false
    combination_array.each { |elem| elem.all?('X') || elem.all?('O') ? win = true : false }
    if win
      puts "Player #{player.name} WINS"
      false
    elsif accu == 9
      puts 'No more plays available. Its a DRAW'
      false
    else
      true
    end
  end
end
