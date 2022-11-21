require_relative 'board'
require_relative 'player'

class TicTacToe

    def initialize(n=3)
        @player_1 = Player.new(:X)
        @player_2 = Player.new(:O)
        @board = Board.new(n)
        @current_player = @player_1
    end

    def switch_players!
        @current_player = @current_player == @player_1 ? @player_2 : @player_1
    end

    def play_turn
        input = @current_player.get_position
        @board[input] = @current_player.mark
        self.switch_players!

    end
    
    # This TicTacToe#play method is given for free and does not need to be modified
    # It is used to make your game playable.
    def play
        until @board.winner?(:X) || @board.winner?(:O)
            p "#{@current_player.mark}'s turn"
            @board.print
            self.play_turn
        end

        @board.print
        self.switch_players!
        p "#{@current_player.mark} has won!"
    end
end
