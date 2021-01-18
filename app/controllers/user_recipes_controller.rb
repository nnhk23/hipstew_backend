class UserRecipesController < ApplicationController
    skip_before_action :authorized

    def index
        user_recipes = UserRecipe.all
        render json: user_recipes      
    end

    def create
        user = User.find(params[:user_id])
        recipe = Recipe.find(params[:recipe_id])
        user_recipe = UserRecipe.create(user_recipe_params)
        render json: user_recipe
    end

    private
    def user_recipe_params
        params.permit(:user_id, :recipe_id, :id)
    end
end
