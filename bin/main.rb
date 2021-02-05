#!/usr/bin/env ruby
puts 'WELCOME'
puts 'This is my TIC TAC TOE game, hope you enjoy it'
updated_board = 'Board Updated.........'
empty_board = 'Displaying empty board'
puts "Press 'S' to start"
response = gets.chomp
board_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
all = [1, 2, 3, 4, 5, 6, 7, 8, 9]
# combination_array = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1 ,4 ,7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 6]]

raise WrongOption unless response == 'S'

# play vs other player
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
puts empty_board # I have to display the board through the display method from the board
puts "Press 'P' to start"
key = gets.chomp
if key == 'P'
  # Start the game vs player 2
  puts "#{player_one} please press H to select 'Heads' or T to select 'Tails'"
  player_coin = gets.chomp
  if player_coin == 'H'
    player_coin = 'heads'
  elsif player_coin == 'T'
    player_coin = 'tails'
  end
  coin = rand.round.zero? ? 'heads' : 'tails'
  puts coin
  puts player_coin
  if player_coin == coin
    all.each do |elem|
      if [1, 3, 5, 7, 9].include?(elem)
        p_one_turn(player_one, board_array, updated_board)
      else
        puts "Player #{player_two}'s turn!"
        band = false
        until band # In case that the slot is filled I need to restart the loop
          puts 'Please select one empty space'
          puts updated_board
          number = gets.chomp.to_i
          if all.include?(number) # I ask if the number selected is in the (1..9) range
            if board_array[number - 1] == 'O' || board_array[number - 1] == 'X'
              puts 'Slot occupied'
            else # analize in the following lines if the next move is a win move or a draw move
              board_array[number - 1] = 'O'
              puts updated_board
              print board_array, "\n"
              band = true # Stops the loop to let the player's next turn
            end
          else
            puts 'No such position'
          end
        end
      end
    end
  elsif player_coin != coin
    all.each do |elem|
      if [1, 3, 5, 7, 9].include?(elem)
        puts "Player #{player_two}'s turn!"
        band = false
        until band # In case that the slot is filled I need to restart the loop
          puts 'Please select one empty space'
          puts updated_board
          number = gets.chomp.to_i
          if all.include?(number) # I ask if the number selected is in the (1..9) range
            if board_array[number - 1] == 'O' || board_array[number - 1] == 'X'
              puts 'Slot occupied'
            else # analize in the following lines if the next move is a win move or a draw move
              board_array[number - 1] = 'O'
              puts updated_board
              print board_array, "\n"
              band = true # Stops the loop to let the player's next turn
            end
          else
            puts 'No such position'
          end
        end
      else
        puts "Player #{player_one}'s turn!"
        band = false
        until band # In case that the slot is filled I need to restart the loop
          puts 'Please select one empty space'
          puts updated_board
          number = gets.chomp.to_i
          if all.include?(number) # I ask if the number selected is in the (1..9) range
            if board_array[number - 1] == 'X' || board_array[number - 1] == 'O'
              puts 'Slot occupied'
            else # analize in the following lines if the next move is a win move or a draw move
              board_array[number - 1] = 'X'
              puts updated_board
              print board_array, "\n"
              band = true # Stops the loop to let the player's next turn
            end
          else
            puts 'No such position'
          end
        end
      end
    end
  end
else
  puts 'Execute the game again to play it'
end

# Temporary methods

# Player one turn method
def p_one_turn(player_one_name, board_array, updated_board)
  puts "Player #{player_one}'s turn!"
  band = false
  until band # In case that the slot is filled I need to restart the loop
    puts 'Please select one empty space'
    puts updated_board
    number = gets.chomp.to_i
    if all.include?(number) # I ask if the number selected is in the (1..9) range
      if board_array[number - 1] == 'X' || board_array[number - 1] == 'O'
        puts 'Slot occupied'
      else # analize in the following lines if the next move is a win move or a draw move
        board_array[number - 1] = 'X'
        puts updated_board
        print board_array, "\n"
        band = true # Stops the loop to let the player's next turn
      end
    else
      puts 'No such position'
    end
  end
end

# Player two turn method

def p_two_turn

end