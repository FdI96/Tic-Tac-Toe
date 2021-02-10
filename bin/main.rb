#!/usr/bin/env ruby

def updated_board(board_array)
  puts "#{board_array[0]} | #{board_array[1]} | #{board_array[2]}"
  puts '-- --- --'
  puts "#{board_array[3]} | #{board_array[4]} | #{board_array[5]}"
  puts '-- --- --'
  puts "#{board_array[6]} | #{board_array[7]} | #{board_array[8]}"
end

def empty_board
  puts '1 | 2 | 3'
  puts '-- --- --'
  puts '4 | 5 | 6'
  puts '-- --- --'
  puts '7 | 8 | 9'
end

def win_or_draw(accu)
  random = rand(0..100)
  return true unless accu >= 4

  if random < 25
    puts 'Player X WINS'
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

def select_slot(band, turn, board_array)
  puts 'Please select one empty space'
  updated_board(board_array)
  number = gets.chomp.to_i
  if (1..9).include?(number)
    if board_array[number - 1] == 'X' || board_array[number - 1] == 'O'
      puts 'Slot occupied'
    else
      puts "TURN VALUE #{turn}"
      board_array[number - 1] = turn ? 'X' : 'O'
      updated_board(board_array)
      band = true
    end
  else
    puts 'No such position'
  end
  band
end

def player_turn(board_array, turn)
  band = false
  band = select_slot(band, turn, board_array) until band
end

puts 'WELCOME'
puts 'This is my TIC TAC TOE game, hope you enjoy it'
puts "Press 'S' to start"
response = gets.chomp
board_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
s_array = %w[S s]
p_array = %w[P p]
raise WrongOption unless s_array.include? response

puts 'Creating Game instance.......'
puts 'Player one name:'
pone = gets.chomp
player_one = pone
puts 'Creating Player 1 Instance'
puts 'Player two name:'
ptwo = gets.chomp
player_two = ptwo
puts "Hello #{player_one} and #{player_two} ready to start the game?"
board = puts 'This is the board instance class'
puts board
empty_board
puts "Press 'P' to start"
key = gets.chomp
if p_array.include? key
  puts "#{player_one} please press H to select 'Heads' or T to select 'Tails'"
  player_coin = gets.chomp
  if player_coin == 'H'
    player_coin = 'heads'
  elsif player_coin == 'T'
    player_coin = 'tails'
  end
  coin = rand.round.zero? ? 'heads' : 'tails'
  accu = 0
  turn = coin == 'head'
  game_on = true
  if player_coin == coin
    while game_on && accu < 9
      puts 'Player X turn!'
      player_turn(board_array, turn)
      game_on = win_or_draw(accu)
      accu += 1
      turn = !turn
    end
  elsif player_coin != coin
    while game_on && accu < 9
      puts 'Player X turn!'
      player_turn(board_array, turn)
      game_on = win_or_draw(accu)
      accu += 1
      turn = !turn
    end
  end
else
  puts 'Execute the game again to play it'
end
