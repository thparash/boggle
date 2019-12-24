class Cell
    attr_accessor :value, :pos_x, :pos_y

    def initialize(value, pos_x, pos_y)
        @value = value
        @pos_x = pos_x
        @pos_y = pos_y
    end

    def get_neighboring_cell_positions(board, pos_x, pos_y)

        neighbors = []
        if pos_x > 0 && pos_y > 0
            neighbors << [pos_x-1, pos_y-1]
        end
    
        if pos_x > 0 && pos_y < (board[0].length-1)
            neighbors << [pos_x-1, pos_y+1]
        end
    
        if pos_x < (board.length-1) && pos_y < (board[0].length-1)
            neighbors << [pos_x+1, pos_y+1]
        end
    
        if pos_x < (board.length-1) && pos_y > 0
            neighbors << [pos_x+1, pos_y-1]        
        end
    
        if pos_x > 0
            neighbors << [pos_x-1,pos_y]
        end
    
        if pos_x < (board.length - 1)
            neighbors << [pos_x+1, pos_y]
        end
    
        if pos_y > 0
            neighbors << [pos_x, pos_y-1]
        end
    
        if pos_y < (board[0].length - 1)
            neighbors << [pos_x, pos_y + 1]
        end
        
        return neighbors
    end
end