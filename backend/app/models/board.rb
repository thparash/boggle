class Board
    attr_accessor :cells, :num_rows, :num_columns

    def initialize(num_rows=4, num_columns=4)
        @num_rows = num_rows
        @num_columns = num_columns
        @cells = []
    end

end
