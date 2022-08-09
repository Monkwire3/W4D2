require_relative "stepable.rb"
require "singleton"
class Piece

    attr_reader :color, :symbol
    #include Stepable
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
    end

    def empty?
    end

    def valid_moves
        return []
    end

    def pos=(val)
    end

    private

    def move_into_check?(end_pos)
    end

end

class NullPiece < Piece
    include Singleton
    def initialize
        @symbol = :N
        @color = nil
        @pos = nil
    end
end

class Pawn < Piece

end

class Rook < Piece
end

class Bishop < Piece
end

class Queen < Piece
end

class King < Piece
    include Stepable

    def valid_moves
        deltas = [[1,0],[1,1],[0,1],[-1,0],[-1,1],[0,-1],[1,-1], [-1,-1]]
        return get_valid_moves(deltas, @pos).map {|m| m if @board[m].color != @color && !move_into_check?(m)}.compact
    end

end


class Knight < Piece
    include Stepable

    def initialize(color, board, pos)
        super
        @symbol = :K
    end

    def valid_moves
        deltas = [[-1, -2], [1, -2], [2, -1], [-2, -1], [-2, 1], [2, 1], [-1, 2], [1, 2]]
        return get_valid_moves(deltas, @pos).map {|m| m if @board[m].color != @color && !move_into_check?(m)}.compact
    end

end

