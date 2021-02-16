#!/usr/bin/env ruby
require_relative '../lib/board.rb'

def updated_board(board_array)
  puts "#{board_array[0]} | #{board_array[1]} | #{board_array[2]}"
  puts '-- --- --'
  puts "#{board_array[3]} | #{board_array[4]} | #{board_array[5]}"
  puts '-- --- --'
  puts "#{board_array[6]} | #{board_array[7]} | #{board_array[8]}"
end

class Player
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
    number = gets.chomp.to_i
    if (1..9).include?(number)
      if board.board_array[number - 1] == 'X' || board.board_array[number - 1] == 'O'
        puts 'Slot occupied'
      else
        board.modify_board(number, turn)
        band = true
      end
    else
      puts 'No such position'
    end
    band
  end

  def win_or_draw(accu, player, combination_array)
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
  puts "#{player_one.name} please press H to select 'Heads' or T to select 'Tails'"
  player_coin = gets.chomp
  if player_coin == 'H'
    player_coin = true
  elsif player_coin == 'T'
    player_coin = false
  end
  coin = rand.round.zero? ? true : false
  turn = coin
  accu = 0
  game_on = true
  if player_coin == coin
    while game_on && accu < 9
      player = board.turn(turn, player_one, player_two)
      puts "Player #{player.name}'s turn!"
      updated_board(board.board_array)
      player.player_turn(board, turn)
      accu += 1
      game_on = player.win_or_draw(accu, player, board.combination_array)
      turn = !turn
    end
  elsif player_coin != coin
    while game_on && accu < 9
      player = board.turn(turn, player_one, player_two)
      puts "Player #{player.name}'s turn!"
      updated_board(board.board_array)
      player.player_turn(board, turn)
      accu += 1
      game_on = player.win_or_draw(accu, player, board.combination_array)
      turn = !turn
    end
  end
else
  puts 'Unknow commnad. Please, Execute the game again to play it'
end
