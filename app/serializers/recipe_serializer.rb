class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :img_url, :instruction, :time, :diet, :dish_type, :price_per_serving, :health_score, :ing_recipes

  def ing_recipes
    self.object.ing_recipes.map do |ing_recipe|
      {
        ingredient: {
          name: ing_recipe.ingredient.name,
          img_url: ing_recipe.ingredient.img_url
        },
        quantityMetricUnit: ing_recipe.quantityMetricUnit,
        quantityUSUnit: ing_recipe.quantityUSUnit
      }
    end
  end

end
