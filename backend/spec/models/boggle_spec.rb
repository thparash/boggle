require 'rails_helper'

RSpec.describe Boggle, type: :model do
  it "should find valid words in a board" do
    board = Board.new(4,4)
    board.cells = [
      [Cell.new('a',0,0),Cell.new('d',0,1),Cell.new('b',0,2),Cell.new('t',0,3)],
      [Cell.new('a',1,0),Cell.new('d',1,1),Cell.new('e',1,2),Cell.new('t',1,3)],
      [Cell.new('t',2,0),Cell.new('a',2,1),Cell.new('e',2,2),Cell.new('t',2,3)],
      [Cell.new('c',3,0),Cell.new('i',3,1),Cell.new('l',3,2),Cell.new('z',3,3)]]

    boggle = Boggle.new(board)      

    expect(boggle.found_words["cat"]).to  eq(true)
    expect(boggle.found_words["data"]).to eq(true)
    expect(boggle.found_words["bet"]).to  eq(true)
    expect(boggle.found_words["add"]).to  eq(true) 
  end

  it "should initialize a game with a board having correct dimensions" do
    boggle = Boggle.new(BoardFactory.create(:board_with_random_letters, 4, 4))
    num_of_rows_in_board = boggle.board.cells.length
    num_of_columns_in_board = boggle.board.cells[0].length

    expect(num_of_rows_in_board).to eq(4)
    expect(num_of_columns_in_board).to eq(4)
  end

  it "should initialize visited board having correct dimensions with false values" do
    boggle = Boggle.new(BoardFactory.create(:board_with_random_letters, 4, 4))
    num_of_rows_in_board = boggle.board.cells.length
    num_of_columns_in_board = boggle.board.cells[0].length

    expect(num_of_rows_in_board).to eq(4)
    expect(num_of_columns_in_board).to eq(4)
    expect(boggle.visited_board.cells[0][0].value).to eq(false)
    expect(boggle.visited_board.cells[2][2].value).to eq(false)
    expect(boggle.visited_board.cells[1][3].value).to eq(false)
  end

end
