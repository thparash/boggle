class CreateBoardFactories < ActiveRecord::Migration[6.0]
  def change
    create_table :board_factories do |t|

      t.timestamps
    end
  end
end
