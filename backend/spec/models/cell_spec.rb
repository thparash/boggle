require 'rails_helper'

RSpec.describe Cell, type: :model do
  it "should initialize with value and row and column positions" do
    cell = Cell.new('A',2,3)

    expect(cell.value).to eq('A')
    expect(cell.pos_x).to eq(2)
    expect(cell.pos_y).to eq(3)

  end

  it "should get neighboring cell positions of a cell" do
    board = [['a','b','c','d'],
              ['e','f','g','h'],
              ['i','j','k','l'],
              ['m','n','o','p']]

    cell = Cell.new('f',1,1)

    neighbors = cell.get_neighboring_cell_positions(board,cell.pos_x,cell.pos_y)

    expect(neighbors).to match_array([[0,0],[0,1],[0,2],[1,0],[1,2],[2,0],[2,1],[2,2]])


    border_cell = Cell.new('a',0,0)

    neighbors = border_cell.get_neighboring_cell_positions(board,border_cell.pos_x,border_cell.pos_y)

    expect(neighbors).to match_array([[0,1],[1,1],[1,0]])

  end

  

end
