class Recipe < ApplicationRecord
    has_many :ing_recipes, dependent: :destroy
    has_many :ingredients, through: :ing_recipes
end
