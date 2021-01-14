require 'key.rb'
require "json"
require 'http'
require 'pry'


def getRecipes(amount)
    key = API_KEY

    url = "https://api.spoonacular.com/recipes/random?apiKey=#{API_KEY}&number=#{amount}"
  
    response = HTTP.get(url)
    response.parse["recipes"]
    # binding.pry
end

