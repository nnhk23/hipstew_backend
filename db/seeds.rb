# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'pry'
require_relative '../lib/api_query.rb'

Recipe.destroy_all
Ingredient.destroy_all
IngRecipe.destroy_all

def create_new_recipes
    getRecipes(100).each do |recipe|
        # binding.pry
        Recipe.create(
            name: recipe["title"],
            img_url: recipe["image"],
            instruction: recipe["instructions"],
            # instruction: recipe["analyzedInstructions"][0]["steps"].map do |step|
            #     "Step #{step["number"].to_s}: #{step["step"]}"
            # end.join(''),
            time: recipe["readyInMinutes"],
            diet: recipe["diets"].join(", "),
            dish_type: recipe["dishTypes"].join(', '),
            price_per_serving: recipe["pricePerServing"],
            health_score: recipe["healthScore"]
        )
        create_new_ingredients(recipe)
    end
end

def create_new_ingredients(recipe)
    recipe["extendedIngredients"].each do |ingredient|
        # binding.pry
        if !Ingredient.find_by(name: ingredient["name"]) 
            Ingredient.create(
                name: ingredient["name"],
                img_url: "https://spoonacular.com/cdn/ingredients_100x100/#{ingredient['image']}"
            )
            create_ing_recipes(recipe, ingredient)
        end

    end
end

def create_ing_recipes(recipe, ingredient)
    # binding.pry
    IngRecipe.create(
        recipe: Recipe.find_by(name: recipe["title"]),
        ingredient: Ingredient.find_by(name: ingredient["name"]),
        quantityUSUnit: ingredient["measures"]["us"]["amount"].to_s + " " + ingredient["measures"]["us"]["unitLong"],
        quantityMetricUnit: ingredient["measures"]["metric"]["amount"].to_s + " " + ingredient["measures"]["metric"]["unitLong"]
    )
end

def generateInstruction(steps)
    recipe_steps = steps.map do |step|
        "Step #{step["number"].to_s}: #{step["step"]}\n"
    end
    return recipe_steps
    # binding.pry
end

create_new_recipes