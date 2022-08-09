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
        #debugger
        #raise "can't move null piece" if @grid[start_pos].is_a?(NullPiece)
        piece = self[start_pos] # grid[0,0] = nil
        self[end_pos] = piece
        self[start_pos] = nil # should be a new Null Piece
    end

end

b = Board.new
pawn = Piece.new
b[[0,0]]=pawn
#p b
p b[[0,0]]
b.move_piece([0,0],[0,1])
p b
