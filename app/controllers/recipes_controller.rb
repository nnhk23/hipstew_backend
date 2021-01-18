class RecipesController < ApplicationController
    skip_before_action :authorized

    def index
        recipes = Recipe.all
        render json: recipes      
    end

    def create
        recipe = Recipe.create(recipe_params)
        render json: recipe
    end

    private
    def recipe_params
        params.permit(:name, :img_url, :recipe_id, :id)
    end

end
