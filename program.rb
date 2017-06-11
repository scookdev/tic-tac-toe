require_relative 'board'
require_relative 'game'
require_relative 'player'

puts ''
board = TicTacToe::Board.new

player = TicTacToe::Player.new
puts "Let's play Tic-Tac-Toe! What's your name?"
player.name = gets.chomp.capitalize

puts ''
player.choose_side

puts ''
computer = TicTacToe::Player.new
computer.side = player.side == 'X' ? 'O' : 'X'

game = TicTacToe::Game.new(board, player, computer)

puts "OK, #{player.name}, you're #{player.side} & I'm #{computer.side}!"

game.play
