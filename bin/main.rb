#!/usr/bin/env ruby
# Temporary methods ------------------------------------------------------------------------------

# Shows board
def updated_board(board_array)
  puts "#{board_array[0]} | #{board_array[1]} | #{board_array[2]}"
  puts '-- --- --'
  puts "#{board_array[3]} | #{board_array[4]} | #{board_array[5]}"
  puts '-- --- --'
  puts "#{board_array[6]} | #{board_array[7]} | #{board_array[8]}"
end

# Shows empty board
def empty_board
  puts '1 | 2 | 3'
  puts '-- --- --'
  puts '4 | 5 | 6'
  puts '-- --- --'
  puts '7 | 8 | 9'
end

# win or draw logic

def win_or_draw(accu, player_two, player_one, turn)
  random = rand(0..100)
  return true unless accu >= 4

  if random < 25
    puts turn ? "#{player_one} WINs!" : "#{player_two} WINs!"
    false
  elsif random < 50
    puts 'Its a DRAW'
    false
  elsif accu == 9
    puts 'No more plays available. Its a DRAW'
    false
  else
    true
  end
end

# Player one turn method
def player_turn(board_array, turn)
  band = false
  until band
    puts 'Please select one empty space'
    updated_board(board_array)
    number = gets.chomp.to_i
    if (1..9).include?(number)
      if board_array[number - 1] == 'X' || board_array[number - 1] == 'O'
        puts 'Slot occupied'
      else
        board_array[number - 1] = turn ? 'X' : 'O'
        updated_board(board_array)
        band = true
      end
    else
      puts 'No such position'
    end
  end
end

puts 'WELCOME'
puts 'This is my TIC TAC TOE game, hope you enjoy it'
puts "Press 'S' to start"
response = gets.chomp
board_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
all = [1, 2, 3, 4, 5, 6, 7, 8, 9]
s_array = %w[S s]
p_array = %w[P p]
# combination_array = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1 ,4 ,7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 6]]

raise WrongOption unless s_array.include? response # IT RAISE AN ERROR IN CASE THAT IS A WRONG OPTION

puts 'Creating Game instance.......'
puts 'Player one name:'
pone = gets.chomp
player_one = pone # Here I have to create a new Player class instance
puts 'Creating Player 1 Instance'
puts 'Player two name:'
ptwo = gets.chomp
player_two = ptwo # Here I have to crate a New Player Instance
puts "Hello #{player_one} and #{player_two} ready to start the game?"
board = puts 'This is the board instance class' # Here I have to create a new Board class instance
# board.display
puts board
empty_board # I have to display the board through the display method from the board instance
puts "Press 'P' to start"
key = gets.chomp
if p_array.include? key
  # Start the game vs player 2
  puts "#{player_one} please press H to select 'Heads' or T to select 'Tails'"
  player_coin = gets.chomp
  if player_coin == 'H'
    player_coin = 'heads'
  elsif player_coin == 'T'
    player_coin = 'tails'
  end
  coin = rand.round.zero? ? 'heads' : 'tails'
  accu = 0
  if player_coin == coin
    game_on = true
    while game_on && accu < 9
      turn = true
      game_on = true
      puts "Player #{player_one}'s turn!"
      player_turn(board_array, all, turn)
      game_on = win_or_draw(accu, player_two, player_one, turn)
      break if game_on == false

      accu += 1
      # HERE ENDS THE PLAYER ONE TURN
      turn = false
      puts "Player #{player_two}'s turn!"
      player_turn(board_array, all, turn)
      game_on = win_or_draw(accu, player_two, player_one, turn)
      accu += 1
      # HERE ENDS THE PLAYER TWO TURN
    end
  elsif player_coin != coin
    game_on = true
    while game_on && accu < 9
      turn = false
      game_on = true
      puts "Player #{player_two}'s turn!"
      player_turn(board_array, turn)
      game_on = win_or_draw(accu, player_two, player_one, turn)
      break if game_on == false

      accu += 1
      # HERE ENDS THE PLAYER TWO TURN
      turn = true
      puts "Player #{player_one}'s turn!"
      player_turn(board_array, turn)
      game_on = win_or_draw(accu, player_two, player_one, turn)
      accu += 1
      # HERE ENDS THE PLAYER ONE TURN
    end
  end
else
  puts 'Execute the game again to play it'
end
