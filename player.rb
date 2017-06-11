module TicTacToe
  # player class
  class Player
    attr_accessor :name, :side
    def choose_side
      puts 'Which side do you want: X or O?'
      @side = gets.chomp.upcase
      until @side.casecmp('x').zero? || @side.casecmp('o').zero?
        puts 'Please enter X or O'
        @side = gets.chomp.upcase
      end
    end

    def move
      puts '', 'Pick a square'
      gets.chomp.upcase.to_sym
    end
  end
end
