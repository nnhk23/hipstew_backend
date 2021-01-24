require 'unirest'


def detect_food(input)
    key = "aca2a9a74cmsh9f1866cc1c8d833p192d44jsnf8082787009f"

    response = Unirest.post "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/food/detect",
    headers:{
        "X-RapidAPI-Host" => "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
        "X-RapidAPI-Key" => "669780fc96msh932057df8539bb3p131150jsna80ca17e0aec",
        "Content-Type" => "application/x-www-form-urlencoded"
    },
    parameters:{
        "text" => "pizza has tomato"
    }
    
    print response.body
    # ["recipes"][0]["extendedIngredients"]
end

