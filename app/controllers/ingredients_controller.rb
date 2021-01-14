class IngredientsController < ApplicationController

    def index
        ingredients = Ingredient.all
        render json: ingredients, except: [:created_at, :updated_at]
    end

end
