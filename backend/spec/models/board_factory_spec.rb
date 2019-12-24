require 'rails_helper'

RSpec.describe BoardFactory, type: :model do
  it "should create a board with random letters" do
    board_with_random_letters_1 = BoardFactory.create(:board_with_random_letters,4,4)
    board_with_random_letters_2 = BoardFactory.create(:board_with_random_letters,4,4)

    expect(board_with_random_letters_1.cells).not_to match_array(board_with_random_letters_2.cells)
  end

  it "should create a board with false value" do
    board_with_false_values = BoardFactory.create(:board_with_false_values,4,4)
    board_with_random_letters = BoardFactory.create(:board_with_random_letters,4,4)

    expect(board_with_false_values.cells).not_to match_array(board_with_random_letters.cells)
    expect(board_with_false_values.cells[1][1].value).to eq(false)
  end
  
end
