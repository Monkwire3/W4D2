require 'byebug'
require_relative "piece.rb"

class Board

    def initialize
        @grid = Array.new(8) {Array.new(8)}
    end

    def [](pos)
        return @grid[pos[1]][pos[0]]
    end

    def []=(pos, piece)
        @grid[pos[1]][pos[0]] = piece
    end


    def move_piece(start_pos, end_pos)
        raise "can't move null piece" if self[start_pos].is_a?(NullPiece)
        #raise 'there is a piece there' if !self[end_pos].is_a?(NullPiece)

        piece = self[start_pos] # grid[0,0] = nil
        self[end_pos] = piece
        self[start_pos] = nil # should be a new Null Piece
    end

end

b = Board.new
#knight = Knight.new(:W, b, [0,0])
#knight2 = Knight.new(:B, b, [1,2])
#knight3 = Knight.new(:B, b, [2,1])
#b[[0,0]]=knight
#b[[1,2]]=knight2
#b[[2,1]]=knight3
king = King.new(:W, b, [0,0])
b[[0,0]]=king
p b
p b[[0,0]]
p '========'
p b[[0,1]]
b.move_piece([0,0],[0,1])
p b
p king.valid_moves
#p knight.valid_moves