class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.string :url
      t.string :address
      t.string :time_of_day
      t.string :weather
      t.string :category
      t.float :price
      t.string :country
      t.string :city
      t.integer :rating
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
