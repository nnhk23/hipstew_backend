class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :img_url
      t.string :instruction
      t.integer :time
      t.string :diet
      t.string :dish_type
      t.integer :price_per_serving
      t.integer :health_score

      t.timestamps
    end
  end
end
