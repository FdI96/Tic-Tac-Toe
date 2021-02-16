#!/usr/bin/env ruby
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

def updated_board(board_array)
  puts "#{board_array[0]} | #{board_array[1]} | #{board_array[2]}"
  puts '-- --- --'
  puts "#{board_array[3]} | #{board_array[4]} | #{board_array[5]}"
  puts '-- --- --'
  puts "#{board_array[6]} | #{board_array[7]} | #{board_array[8]}"
end

def loop_slot(band, board, turn)
  until band
    puts 'Please select one empty space'
    updated_board(board.board_array)
    number = gets.chomp.to_i
    if (1..9).include?(number)
      if board.board_array[number - 1] == 'X' || board.board_array[number - 1] == 'O'
        puts 'Slot occupied'
      else
        band = board.modify_board(number, turn)
      end
    else
      puts 'No such position'
    end
  end
end

s_array = %w[S s]
p_array = %w[P p]
puts 'WELCOME'
puts 'This is my TIC TAC TOE game, hope you enjoy it'
puts "Press 'S' to start"
response = gets.chomp
raise WrongOption unless s_array.include? response

ca = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
b = [1, 2, 3, 4, 5, 6, 7, 8, 9]
board = Board.new(b, ca)
puts 'Player one name:'
pone = gets.chomp
player_one = Player.new(pone)
puts 'Player two name:'
ptwo = gets.chomp
player_two = Player.new(ptwo)
puts "Hello #{player_one.name} and #{player_two.name} ready to start the game?"
updated_board(board.board_array)
puts "Press 'P' to start"
key = gets.chomp
if p_array.include? key
  turn = true
  accu = 0
  game_on = true
  while game_on && accu < 9
    player = board.turn(turn, player_one, player_two)
    puts "Player #{player.name}'s turn!"
    band = false
    loop_slot(band, board, turn)
    game_on = board.win_or_draw(accu)
    accu += 1
    if accu == 9
      updated_board(board.board_array)
      puts 'No more plays available. Its a DRAW'
    elsif !game_on
      puts "Player #{player.name} WINS"
    end
    turn = !turn
  end
else
  puts 'Unknow commnad. Please, Execute the game again to play it'
end
