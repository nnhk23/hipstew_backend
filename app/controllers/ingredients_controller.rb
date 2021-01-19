class IngredientsController < ApplicationController
    skip_before_action :authorized

    def index
        ingredients = Ingredient.all
        render json: ingredients
    end

    def create
        ingredient = Ingredient.create(ingredient_params)
        render json: ingredient
    end

    private
    def ingredient_params
        params.permit(:name, :img_url, :type)
    end

end
