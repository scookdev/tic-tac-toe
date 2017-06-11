module TicTacToe
  # board class
  class Board
    attr_accessor :squares
    attr_accessor :available_squares
    def initialize
      @squares = { A1: ' ', A2: ' ', A3: ' ',
                   B1: ' ', B2: ' ', B3: ' ',
                   C1: ' ', C2: ' ', C3: ' ' }
    end

    def draw
      puts '', '     A   B   C'
      puts '   +---+---+---+'
      puts " 1 | #{@squares[:A1]} | #{@squares[:B1]} | #{@squares[:C1]} |\r\n"
      puts '   +---+---+---+'
      puts " 2 | #{@squares[:A2]} | #{@squares[:B2]} | #{@squares[:C2]} |"
      puts '   +---+---+---+'
      puts " 3 | #{@squares[:A3]} | #{@squares[:B3]} | #{@squares[:C3]} |"
      puts '   +---+---+---+'
    end
  end
end
