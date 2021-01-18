class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :img_url, :recipe_id
end
