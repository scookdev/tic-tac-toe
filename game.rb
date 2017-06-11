module TicTacToe
  # game class
  class Game
    attr_accessor :board, :player, :computer, :current_side, :wins

    def initialize(board, player, computer)
      @board = board
      @player = player
      @computer = computer
      @current_play = @player
      @wins = [
        %i[A1 A2 A3], %i[B1 B2 B3], %i[C1 C2 C3],
        %i[A1 B1 C1], %i[A2 B2 C2], %i[A3 B3 C3],
        %i[A1 B2 C3], %i[C1 B2 A3]
      ]
    end

    def play
      loop do
        @board.draw if @current_play == @player
        square = @current_play == @player ? @current_play.move : computer_move
        if valid_move? square
          @board.squares[square] = @current_play.side
          if win_or_draw?
            play_again?
          else
            puts '', "I'll take #{square}" if @current_play == @computer
            switch_sides
          end
        end
      end
    end

    def valid_move?(square)
      if !@board.squares.key?(square)
        puts '', 'Invalid move - please select a square from the grid'
        false
      elsif !@board.squares[square].strip.empty?
        puts '', 'That square is already taken'
        false
      else
        true
      end
    end

    def switch_sides
      @current_play = @current_play == @player ? @computer : @player
    end

    def computer_move
      available_squares.keys.sample
    end

    def win_or_draw?
      @wins.each do |win|
        if @board.squares[win[0]] == @current_play.side &&
           @board.squares[win[1]] == @current_play.side &&
           @board.squares[win[2]] == @current_play.side
          @board.draw
          if @current_play == @player
            puts '', 'You win!'
          else
            puts '', 'I win!'
          end
          return true
        end
      end

      if available_squares.count.zero?
        puts '', "That's a draw, #{@current_play.name}"
        return true
      end
    end

    def available_squares
      @board.squares.select { |k, v| v.strip.empty? }
    end

    def play_again?
      puts '', 'Care to take me on again? [Y/n]'
      response = gets.chomp.downcase

      if response == 'y'
        TicTacToe::Game.new(TicTacToe::Board.new, @player, @computer).play
      else
        puts '', 'Ciao!'
        exit
      end
    end
  end
end
