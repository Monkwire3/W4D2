require 'byebug'
require_relative "piece.rb"

class Board

    attr_accessor :grid

    def initialize
        @grid = Array.new(8) {Array.new(8)}
    end


    def [](pos)
        return @grid[pos[1]][pos[0]]
    end

    def []=(pos, piece)
        @grid[pos[1]][pos[0]] = piece
    end

    def populate_board 
        null_piece = NullPiece.instance
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                @grid[i][j] = null_piece
            end
        end

    end

    def dup
        return @grid.map {|el| el.is_a?(Array) ? el.dup : el}
    end


    def move_piece(start_pos, end_pos)
        raise "can't move null piece" if self[start_pos].is_a?(NullPiece)
        #raise 'there is a piece there' if !self[end_pos].is_a?(NullPiece)

        piece = self[start_pos] # grid[0,0] = nil
        self[end_pos] = piece
        self[start_pos] = NullPiece.instance
    end

    def print_board
        puts @grid.map {|row| row.map(&:symbol).join(" ")}
    end

end

b = Board.new
p "===-=-=-=-=-=-=-="
#b.print_board
b.populate_board
b.print_board

knight = Knight.new(:W, b, [0, 0])
b[[0,0]] = knight
b.print_board

p "========"
b.move_piece([0,0], [0,1])
b.print_board