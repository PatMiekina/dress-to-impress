class CreateDresses < ActiveRecord::Migration[6.0]
  def change
    create_table :dresses do |t|
      t.string :title
      t.text :description
      t.string :size
      t.string :brand
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
