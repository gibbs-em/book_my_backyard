class CreateGardens < ActiveRecord::Migration[6.0]
  def change
    create_table :gardens do |t|
      t.string :title
      t.text :description
      t.text :address
      t.text :postcode
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
