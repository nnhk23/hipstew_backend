class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :img_url, :recipe_id, :user_recipes

  def user_recipes
    self.object.user_recipes.map do |user_recipe|
      {
        user_recipe_id: user_recipe.id,
        user_id: user_recipe.user.id
      }
    end
  end

end
