class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.integer :quantity
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
