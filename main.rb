# building a mastermind game

# code creator will:
#  pick 4 colors 
#  provice feedback with pegs (red or black) based on the guesses

# guesser:
# input 4 colors

require_relative 'lib/board'

Game = Board.new
Game.generate_code