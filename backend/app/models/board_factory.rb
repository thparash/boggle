class BoardFactory
    def self.create(type,num_ofrows=4,num_of_colums=4)
        case type 
            when :board_with_random_letters
                board = Board.new(4,4)
                BoardFactory.fill_board_cells_with_random_letters(board)
                return board
            when :board_with_false_values
                board = Board.new(4,4)
                BoardFactory.fill_board_cells_with_false_values(board)
                return board
        end
    end

    def self.fill_board_cells_with_random_letters(board)
        board_with_random_letters = []
        (0...board.num_rows).each do |x|
            board_with_random_letters << (0...board.num_columns).map { |y| Cell.new((65 + rand(26)).chr.downcase,x,y) }
        end   
        board.cells = board_with_random_letters
    end

    def self.fill_board_cells_with_false_values(board)
        board_with_false_values = []
        (0...board.num_rows).each do |x|
            board_with_false_values << (0...board.num_columns).map { |y| Cell.new(false,x,y) }
        end   
        board.cells = board_with_false_values
    end
end