class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :country
      t.string :city
      t.string :address
      t.integer :capacity
      t.string :main_picture
      t.text :description
      t.string :title
      t.integer :price_per_night
      t.references :user, index: true

      t.timestamps
    end
  end
end
