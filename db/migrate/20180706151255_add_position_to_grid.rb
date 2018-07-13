class AddPositionToGrid < ActiveRecord::Migration[5.1]
  def change
    add_column :grids, :position, :integer
  end
end
