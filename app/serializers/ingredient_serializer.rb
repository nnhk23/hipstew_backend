class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :img_url
  # , :type
end
