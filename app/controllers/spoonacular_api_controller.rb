require './lib/key.rb'

class SpoonacularApiController < ApplicationController
  skip_before_action :authorized

  def show
    
    ingredientString = params["ingredients"].split(', ').map do |ing|
      if ing.include?(' ') 
        ing[' '] = '-' 
      end
      
      ing + '%2C'
      
    end.join()
    # byebug

    url = "https://api.spoonacular.com/recipes/findByIngredients?apiKey=#{API_KEY}&ingredients=#{ingredientString}&number=20"
    
    response = HTTP.get(url)
    data = response.parse
    render json: data

  end

  def get_recipe

    url = "https://api.spoonacular.com/recipes/#{params["id"]}/information?apiKey=#{API_KEY}"
    response = HTTP.get(url)
    data = response.parse
    render json: data

  end

  def get_recipe_instruction

    url = "https://api.spoonacular.com/recipes/extract?apiKey=#{API_KEY}&url=#{params["sourceUrl"]}&forceExtraction=true"
    response = HTTP.get(url)
    data = response.parse
    render json: data

  end

end
