class CreateBoggles < ActiveRecord::Migration[6.0]
  def change
    create_table :boggles do |t|

      t.timestamps
    end
  end
end
