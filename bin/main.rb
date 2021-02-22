#!/usr/bin/env ruby
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

def loop_slot(band, board, turn)
  until band
    puts 'Please select one empty space'
    puts board.updated_board
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

def game(board, player_one, player_two)
  turn = true
  accu = 0
  game_on = true
  while game_on && accu < 9
    player = board.turn(turn, player_one, player_two)
    puts "#{player}'s turn!"
    band = false
    loop_slot(band, board, turn)
    game_on = board.win_or_draw(accu)
    accu += 1
    if accu == 9
      puts 'No more plays available. Its a DRAW'
      puts board.updated_board
    elsif !game_on
      puts "#{player} WINS"
      puts board.updated_board
    end
    turn = !turn
  end
  game_on
end

s_array = %w[S s]
p_array = %w[P p]
puts 'WELCOME'
puts 'This is my TIC TAC TOE game, hope you enjoy it'
puts "Type 'S' to start"
response = gets.chomp
raise WrongOption unless s_array.include? response

ca = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
b = [1, 2, 3, 4, 5, 6, 7, 8, 9]
board = Board.new(b, ca)
puts 'Player one name:'
pone = gets.chomp
pone = 'Player One' if pone == ''
player_one = Player.new(pone)
puts 'Player two name:'
ptwo = gets.chomp
ptwo = 'Player Two' if ptwo == ''
player_two = Player.new(ptwo)
puts "Hello #{player_one.name} and #{player_two.name} ready to start the game?"
puts board.updated_board
puts "Type 'P' to start"
key = gets.chomp
if p_array.include? key
  game(board, player_one, player_two)
else
  puts 'Unknow commnad. Please, Execute the game again to play it'
end
