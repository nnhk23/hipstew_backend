Rails.application.routes.draw do
  resources :user_ingres
  resources :ingredients
  resources :user_recipes
  resources :recipes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/login", to: "users#login"
  get "/getuser", to: "users#get_user"
  get "/getrecipe", to: 'spoonacular_api#show'
  get "/getrecipedetails", to: 'spoonacular_api#get_recipe'
  get "/getrecipeinstruction", to: 'spoonacular_api#get_recipe_instruction'
  get "/getingredients", to: 'spoonacular_api#get_ingredients'
  get "/getrandomrecipes", to: 'spoonacular_api#get_5_random_recipes'
  get "/complexrecipesearch", to: 'spoonacular_api#search_by_name_and_ingredients'
  get '/foodtrivia', to: 'spoonacular_api#get_food_trivia' 
  get '/foodjokes', to: 'spoonacular_api#get_food_jokes'
  

  # get "/chatbotresult", to: 'duckduckgo#get_result'
  get "/detectfood", to: 'spoonacular_chatbot#detect_food_in_text'
  get '/quickanswer', to: 'spoonacular_chatbot#get_quick_answer'

end
