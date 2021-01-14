class RecipesController < ApplicationController

    def index
        recipes = Recipe.all
        render json: recipes.to_json(
            :include => {
                :ing_recipes => {
                    :except => [:created_at, :updated_at]
                }
            }, 
            :except => [:created_at, :updated_at]        
        )
    end

    def create
        recipe = Recipe.create(recipe_params)
        render json: recipe.to_json(
            :include => {
                :ing_recipes => {
                    :except => [:created_at, :updated_at]
                }
            }
        )
    end

    private
    def recipe_params
        params.require(:recipe).permit(:name, :img_url, :instruction, :time, :diet, :dish_type, :price_per_serving, :health_score)
    end

end
