module Slideable

    def get_cross(cur_pos)
        cross = []
        (0...8).each {|i| cross << [cur_pos[0], i]}
        (0...8).each {|i| cross << [i, cur_pos[1]]}
        return cross.map {|el| el if el != cur_pos}.compact
    end

end