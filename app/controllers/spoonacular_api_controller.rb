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

    url = "#{BASE_URL}/recipes/findByIngredients?apiKey=#{API_KEY}&ingredients=#{ingredientString}&number=54"
    
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

  def get_5_random_recipes
    # byebug

    url = "#{BASE_URL}/recipes/random?apiKey=#{API_KEY}&number=5"
    response = HTTP.get(url)
    data = response.parse
    render json: data
    
  end
  
  def search_by_name_and_ingredients

    dish = params["dish"]
    if (params["dish"].include?(' '))
      dish = params["dish"].split(' ').join('-')
    end

    if (params["ingredients"])
      ingredients = params["ingredients"].include?(' ') ? params["ingredients"].split(' ').join('-') : params["ingredients"]
    end
    
    if (params["ingredients"] && params["dish"].length != 0) 
      url = "#{BASE_URL}/recipes/complexSearch?apiKey=#{API_KEY}&includeIngredients=#{ingredients}&query=#{dish}&number=27"
    elsif (params["dish"].length != 0)
      url = "#{BASE_URL}/recipes/complexSearch?apiKey=#{API_KEY}&query=#{dish}&number=27"
    else
      url = "#{BASE_URL}/recipes/complexSearch?apiKey=#{API_KEY}&includeIngredients=#{ingredients}&number=27"
    end
      
    response = HTTP.get(url)
    data = response.parse
    render json: data

  end

  def get_food_jokes

    url = "#{BASE_URL}/food/jokes/random?apiKey=#{API_KEY}"
    response = HTTP.get(url)
    data = response.parse
    render json: data
    
  end

  def get_food_trivia

    url = "#{BASE_URL}/food/trivia/random?apiKey=#{API_KEY}"
    response = HTTP.get(url)
    data = response.parse
    render json: data

  end

  # def get_quick_answer
    
  #   userInput = params["userInput"]
  #   if (params["userInput"].include?(' '))
  #     userInput = params["userInput"].split(' ').join('-')
  #   end
    
  #   url = "#{BASE_URL}/recipes/quickAnswer?apiKey=#{API_KEY}&q=#{userInput}"
  #   byebug
  #   response = HTTP.get(url)
  #   data = response.parse
  #   byebug
  #   render json: data

  # end

end
