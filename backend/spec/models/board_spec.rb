require 'rails_helper'

RSpec.describe Board, type: :model do
  it "should initialize 4 by 4 board if number of rows and columns are not provided" do
    board = Board.new
    num_of_rows_in_board = board.num_rows
    num_of_columns_in_board = board.num_columns

    expect(num_of_rows_in_board).to eq(4)
    expect(num_of_columns_in_board).to eq(4)
  end
end
