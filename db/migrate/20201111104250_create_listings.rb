# frozen_string_literal: true

class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.string :brand
      t.float :price
      t.integer :size
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
