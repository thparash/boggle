class Boggle
    attr_accessor :board, :visited_board, :found_words
    def initialize(num_rows, num_cols, path_to_dictionary_file='/public/words.txt')
        @found_words = {}
        @board = BoardFactory.create(:board_with_random_letters, num_rows, num_cols)
        @visited_board = BoardFactory.create(:board_with_false_values, num_rows, num_cols)
        
        create_trie_for_dictionary_words
        find_valid_words_in_board
    end
    
    private

    def find_valid_words_in_board
        @board.cells.each_with_index do |row, row_index|
            row.each_with_index do |column, column_index|
                explore(row_index, column_index, @trie.root_node)
            end
        end
    end

    def explore(row_index, column_index,trie_node)

        current_cell = @board.cells[row_index][column_index]
        visited_cell = @visited_board.cells[row_index][column_index]

        #if cell is already visited stop searching and just return    
        if visited_cell.value
            return
        end
        
        letter = current_cell.value
    
        if !trie_node.key?(letter)
            return
        end
        
        visited_cell.value = true
    
        trie_node = trie_node[letter]
    
        if trie_node.key?("*")
            @found_words[trie_node["*"]] = true
        end
    
        neighbors = current_cell.get_neighboring_cell_positions(@board.cells,row_index,column_index)

        neighbors.each do |neighbor|
            explore(neighbor[0],neighbor[1],trie_node)
        end
    
        visited_cell.value = false
    end

    def create_trie_for_dictionary_words
        @trie = Trie.new

        File.readlines(Rails.root.join("public", "words.txt")).each do |word|
            @trie.add(word.strip)
        end
    end

end