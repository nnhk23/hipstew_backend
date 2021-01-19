require './lib/key.rb'

class SpoonacularApiController < ApplicationController
  skip_before_action :authorized
  BASE_URL='https://api.spoonacular.com'

  def show
    
    ingredientString = params["ingredients"].split(', ').map do |ing|
      if ing.include?(' ') 
        ing[' '] = '-' 
      end 
      ing + '%2C'
    end.join()

    url = "#{BASE_URL}/recipes/findByIngredients?apiKey=#{API_KEY}&ingredients=#{ingredientString}&number=20"
    
    response = HTTP.get(url)
    data = response.parse

    if data.length === 0
      render json: {error: "There is no recipe for #{params["ingredients"]}. Please try another search term."}
    else
      render json: data
    end

  end

  def get_recipe

    url = "#{BASE_URL}/recipes/#{params["id"]}/information?apiKey=#{API_KEY}"
    response = HTTP.get(url)
    data = response.parse
    render json: data

  end

  def get_recipe_instruction

    url = "#{BASE_URL}/recipes/extract?apiKey=#{API_KEY}&url=#{params["sourceUrl"]}&forceExtraction=true"
    response = HTTP.get(url)
    data = response.parse
    render json: data

  end

  def get_ingredients

    url = "#{BASE_URL}/food/ingredients/search?apiKey=#{API_KEY}&query=#{params["ingredient"]}&number=24"
    response = HTTP.get(url)
    data = response.parse

    if data["results"].length === 0
      render json: {error: "There is no result for #{params["ingredient"]}. Please try another search term."}
    else
      render json: data
    end

  end

end
