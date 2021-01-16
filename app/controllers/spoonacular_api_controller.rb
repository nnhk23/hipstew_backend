require './lib/key.rb'

class SpoonacularApiController < ApplicationController
  skip_before_action :authorized

  def show
    
    ingredientString = params["ingredients"].split(', ').map do |ing|
      ing + '%2C'
    end.join()

    url = "https://api.spoonacular.com/recipes/findByIngredients?apiKey=#{API_KEY}&ingredients=#{ingredientString}&number=50"
    
    response = HTTP.get(url)
    data = response.parse
    render json: data

  end

  def get_recipe
    # byebug

    url = "https://api.spoonacular.com/recipes/#{params["id"]}/information?apiKey=#{API_KEY}"
    response = HTTP.get(url)
    data = response.parse
    render json: data

  end

end
