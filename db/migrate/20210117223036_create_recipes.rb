class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :img_url
      t.integer :recipe_id

      t.timestamps
    end
  end
end
