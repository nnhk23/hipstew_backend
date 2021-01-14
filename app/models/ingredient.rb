class Ingredient < ApplicationRecord
    has_many :ing_recipes
    has_many :recipes, through: :ing_recipes
end
