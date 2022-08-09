module Stepable

    def get_valid_moves(deltas, cur_pos)
        possible_moves = deltas.map do |pos|
            x, y = pos[0], pos[1]
            [x, y] if (x + cur_pos[0] <= 8 && y + cur_pos[1] <= 8 && x + cur_pos[0] >= 0 && y + cur_pos[1] >= 0)
        end.compact

        return possible_moves
    end

end