#!/usr/bin/env ruby
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

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
board.updated_board
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
      player.player_turn(board, turn)
      accu += 1
      game_on = board.win_or_draw(accu, player)
      turn = !turn
    end
  elsif player_coin != coin
    while game_on && accu < 9
      player = board.turn(turn, player_one, player_two)
      puts "Player #{player.name}'s turn!"
      player.player_turn(board, turn)
      game_on = board.win_or_draw(accu, player)
      accu += 1
      turn = !turn
    end
  end
else
  puts 'Execute the game again to play it'
end
