class Recipe < ApplicationRecord
    has_many :ing_recipes
    has_many :ingredients, through: :ing_recipes
end
