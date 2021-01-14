class Recipe < ApplicationRecord
    has_many :ing_recipes, dependent: :destroy
    has_many :ingredients, through: :ing_recipes
    has_many :user_recipes
    has_many :users, through: :user_recipes
end
