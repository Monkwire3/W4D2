class Piece

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
    def initialize
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

end


class Knight < Piece
    def valid_moves
        deltas = [[-1, -2], [1, -2], [2, -1], [-2, -1], [-2, 1], [2, 1], [-1, 2], [1, 2]]

        possible_moves = deltas.map do |pos|
            x, y = pos[0], pos[1]
            [x, y] if (x + @pos[0] <= 8 && y + @pos[1] <= 8 && x + @pos[0] >= 0 && y + @pos[1] >= 0)
        end.compact

        return possible_moves.each {|m| valid << @board[m].color != @color && !move_into_check?(m)}
    end

end

