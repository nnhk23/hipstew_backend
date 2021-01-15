class IngredientsController < ApplicationController
    skip_before_action :authorized

    def index
        ingredients = Ingredient.all
        render json: ingredients
    end

end
