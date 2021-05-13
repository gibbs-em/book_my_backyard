class AddFeaturesToGardens < ActiveRecord::Migration[6.0]
  def change
    add_column :gardens, :toilet, :boolean, default: false
    add_column :gardens, :rain_shelter, :boolean, default: false
    add_column :gardens, :bbq, :boolean, default: false
    add_column :gardens, :peaceful, :boolean, default: false
    add_column :gardens, :heater, :boolean, default: false
  end
end
