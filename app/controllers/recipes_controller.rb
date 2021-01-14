class RecipesController < ApplicationController

    def index
        recipes = Recipe.all
        render json: recipes, except: [:created_at, :updated_at]
    end

end
