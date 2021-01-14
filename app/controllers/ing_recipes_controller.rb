class IngRecipesController < ApplicationController
    # serialize :quantity, Hash

    def index
        ingrecipes = IngRecipe.all
        render json: ingrecipes, except: [:created_at, :updated_at]
    end

end
