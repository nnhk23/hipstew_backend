class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :user_recipes

  def user_recipes
    self.object.user_recipes.map do |user_recipe|
      {
        user_recipe_id: user_recipe.id,
        id: user_recipe.recipe.id,
        name: user_recipe.recipe.name,
        img_url: user_recipe.recipe.img_url,
        recipe_id: user_recipe.recipe.recipe_id
      }
    end
  end

end
