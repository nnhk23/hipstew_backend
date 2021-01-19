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

end
