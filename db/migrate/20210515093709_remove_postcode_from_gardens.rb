class RemovePostcodeFromGardens < ActiveRecord::Migration[6.0]
  def change
    remove_column :gardens, :postcode
  end
end
