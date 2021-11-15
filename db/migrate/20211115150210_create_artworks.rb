class CreateArtworks < ActiveRecord::Migration[6.0]
  def change
    create_table :artworks do |t|
      t.string :location
      t.integer :price
      t.string :category
      t.references :user, null: false, foreign_key: true
      t.string :description
      t.string :title

      t.timestamps
    end
  end
end
