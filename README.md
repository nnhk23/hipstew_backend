# Hipstew (Backend)

Hipstew is built to help user look for recipes based on ingredients instead of name. You can also keep track of your fridge using a Fridge feature and also look up ingredients to add as well! There is also a chatbot, Stewy, who will assist you with conversion, recipe search or just to have a small talk with, be sure to check it out :)!

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

Link to Hipstew's frontend: https://github.com/nnhk23/hipstew_frontend

## Installing

For this program, please type in these following commands in your terminal before starting: 

Gems Installation:
```bundle ```

Obtain an API key from [Spoonacular API](https://spoonacular.com/food-api).

Under My Console, click on Profile, your API key should be there.

Create a new file in lib folder: `lib/key.rb`

Add your API key in `key.rb` as ```API_KEY="your-very-long-and-complicated-string"```

Install [Postgres](https://www.postgresql.org/) and have it running.

## Start

(make sure to also complete frontend's installing instruction before strating the program :) )

Run ```rails s```

## Built With

* [Ruby on Rails](https://rubyonrails.org/) - Main framework.
* [Spoonacular API](https://spoonacular.com/food-api) - external API.
* [JWT Authentication](https://jwt.io/) - handle user login/signup.
* [Postgres](https://www.postgresql.org/) - database.

## Authors

* **Kim Nguyen** - [Github Link](https://github.com/nnhk23)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Inspired by foody apps: Spoonacular, Mealime, Hello Fresh.

## Final Note
Feel free to contact me via socials included in Hipstew's footer. Happy coding!
