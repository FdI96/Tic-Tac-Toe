#!/usr/bin/env ruby
# Temporary methods ------------------------------------------------------------------------------

super_var = nil
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
def win_or_draw(win, i)
  # rand(0..30) < 10 ? win = true : rand(0..30) < 20 ? draw = true : (win , draw = false , false)
  random = rand(0..30)
  if random < 10 && random > 0
    win = true
  elsif random < 20 && random > 11
    draw = true
  end
end

# Player one turn method
def p_one_turn(player_one, board_array, all, game_on, i, win, draw)
  puts "Player #{player_one}'s turn!"  
  band = false
  until band # In case that the slot is filled I need to restart the loop
    puts 'Please select one empty space'
    updated_board(board_array)
    number = gets.chomp.to_i
    if all.include?(number) # I ask if the number selected is in the (1..9) range
      if board_array[number - 1] == 'X' || board_array[number - 1] == 'O'
        puts 'Slot occupied'
      else # analize in the following lines if the next move is a win move or a draw move
        board_array[number - 1] = 'X'
        updated_board(board_array)
        print board_array, "\n"
        band = true # Stops the loop to let the player's next turn
      end
    else
      puts 'No such position'
    end
  end
  if i >= 4
    if win == true
      puts "#{player_one} WINs!"
      super_var = false
    elsif draw == true
      puts 'Its a DRAW'
      super_var = false
    elsif i == 9
      puts 'No more plays available. Its a DRAW'
      super_var = false
    end
  end
  puts "GAME ON IS ???? #{super_var}"
end

# Player two turn method

def p_two_turn(player_two, board_array, all, game_on, i, win, draw)
  puts "Player #{player_two}'s turn!"
  band = false
  until band # In case that the slot is filled I need to restart the loop
    puts 'Please select one empty space'
    updated_board(board_array)
    number = gets.chomp.to_i
    if all.include?(number) # I ask if the number selected is in the (1..9) range
      if board_array[number - 1] == 'O' || board_array[number - 1] == 'X'
        puts 'Slot occupied'
      else # analize in the following lines if the next move is a win move or a draw move
        board_array[number - 1] = 'O'
        updated_board(board_array)
        print board_array, "\n"
        band = true # Stops the loop to let the player's next turn
      end
    else
      puts 'No such position'
    end
  end
  if i >= 4
    if win == true
      puts "#{player_two} WINs!"
      super_var = false
    elsif draw == true
      puts 'Its a DRAW'
      super_var = false
    elsif i == 9
      puts 'No more plays available. Its a DRAW'
      super_var = false
    end
  end
  puts "GAME ON IS ???? #{super_var}"
end

puts 'WELCOME'
puts 'This is my TIC TAC TOE game, hope you enjoy it'
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
empty_board # I have to display the board through the display method from the board instance
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
  game_on = true
  win = false
  draw = false
  i = 0
  if player_coin == coin
    while game_on
      random = rand(0..30)
      if random < 10 && random > 0
        win = true
      elsif random < 20 && random > 11
        draw = true
      end
      p_one_turn(player_one, board_array, all, game_on, i, win, draw)
      game_on = super_var
      i += 1
      puts "GAME ON IS ----------> #{game_on}" 
      random = rand(0..30)
      if random < 10 && random > 0
        win = true
      elsif random < 20 && random > 11
        draw = true
      end
      p_two_turn(player_two, board_array, all, game_on, i, win, draw)
      game_on = super_var
      i += 1
      puts "GAME ON IS ----------> #{game_on}"
    end
    # all.each do |elem|
    #   if [1, 3, 5, 7, 9].include?(elem)
    #     p_one_turn(player_one, board_array, all)
    #   else
    #     p_two_turn(player_two, board_array, all)
    #   end
    # end
  elsif player_coin != coin
    game_on = true
    win = false
    draw = false
    i = 0
    while game_on
      random = rand(0..30)
      if random < 10 && random > 0
        win = true
      elsif random < 20 && random > 11
        draw = true
      end 
      p_one_turn(player_one, board_array, all, game_on, i, win, draw)
      i += 1
      puts "GAME ON IS ----------> #{game_on}"
      random = rand(0..30)
      if random < 10 && random > 0
        win = true
      elsif random < 20 && random > 11
        draw = true
      end
      p_two_turn(player_two, board_array, all, game_on, i, win, draw)
      i += 1
      puts "GAME ON IS ----------> #{game_on}"
    end
    
    # all.each do |elem|      
    #   if [1, 3, 5, 7, 9].include?(elem)
    #     p_two_turn(player_two, board_array, all)
    #   else
    #     p_one_turn(player_one, board_array, all)
    #   end
    # end
  end
else
  puts 'Execute the game again to play it'
end
