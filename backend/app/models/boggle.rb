class Boggle < ApplicationRecord
    attr_accessor :board, :visited_board, :found_words
    def initialize(board)
        #stores all the valid words found in a board
        @found_words = {}

        @board = board

        #board that tracks if each cell of a board has already been visited
        @visited_board = BoardFactory.create(:board_with_false_values, @board.num_rows, @board.num_columns)
        
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

    #performs depth first search to find valid words in a board
    def explore(row_index, column_index,trie_node)

        current_cell = @board.cells[row_index][column_index]
        visited_cell = @visited_board.cells[row_index][column_index]

        #if a cell at row_index and column_index is already visited for the current search, stop searching and just return    
        if visited_cell.value
            return
        end
        
        letter = current_cell.value
    
        #only proceed with the search if current node has the letter, otherwise return
        if !trie_node.key?(letter)
            return
        end
        
        #mark the cell at row_index and column_index as visited
        visited_cell.value = true
    
        #set current node as trie_node
        trie_node = trie_node[letter]
    
        #checks if a node contains the end symbol '*'.If it does, it means a valid word is found.
        #store found word in @found_words
        if trie_node.key?("*")
            @found_words[trie_node["*"]] = true
        end
    
        #get neigbouring cell positions of the current cell
        neighbors = current_cell.get_neighboring_cell_positions(@board.cells,row_index,column_index)

        #recursively perform depth first search for each neighboring cells
        neighbors.each do |neighbor|
            explore(neighbor[0],neighbor[1],trie_node)
        end
    
        #after visiting all the neighboring cells of a visited cell, mark the cell again as unvisited
        visited_cell.value = false
    end

    def create_trie_for_dictionary_words
        @trie = Trie.new

        begin
            File.readlines(Rails.root.join("public", "words.txt")).each do |word|
                @trie.add(word.strip)
            end
        rescue Errno::ENOENT
            puts "File not found"
        rescue ArgumentError
            puts "File contains unparsable words"
        end

    end

end