class IngRecipesController < ApplicationController
    skip_before_action :authorized

    def index
        ing_recipes = IngRecipe.all
        render json: ing_recipes.to_json(
            :include => {
                :ingredient => {
                    :except => [:created_at, :updated_at]
                }
            }, 
            :except => [:created_at, :updated_at]
        )
        
    end

    def create
        ingredient = Ingredient.find(params[:ingredient_id])
        recipe = Recipe.find(params[:recipe_id])
        ing_recipe = IngRecipe.create(ing_recipe_params)
        render json: ing_recipe.to_json(
            :include => {
                :ingredient => {
                    :except => [:created_at, :updated_at]
                }
            }
        )
    end

    private
    def ing_recipe_params
        params.require(:ing_recipe).permit(:quantity, :recipe_id, :ingredient_id)
    end

end
