class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :user_recipes, :user_ingres

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

  def user_ingres
    self.object.user_ingres.map do |user_ingre|
      {
        user_ingre_id: user_ingre.id,
        id: user_ingre.ingredient.id,
        name: user_ingre.ingredient.name,
        img_url: user_ingre.ingredient.img_url
      }
    end
  end

end
