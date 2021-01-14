class CreateIngRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :ing_recipes do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.string :quantityMetricUnit
      t.string :quantityUSUnit

      t.timestamps
    end
  end
end
