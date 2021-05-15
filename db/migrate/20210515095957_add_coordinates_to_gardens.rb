class AddCoordinatesToGardens < ActiveRecord::Migration[6.0]
  def change
    add_column :gardens, :latitude, :float, default: 0
    add_column :gardens, :longitude, :float, default: 0
  end
end
