require './lib/key.rb'
require "uri"
require "net/http"

class SpoonacularChatbotController < ApplicationController
    skip_before_action :authorized

    def detect_food_in_text
        url = URI("https://api.spoonacular.com/food/detect?apiKey=#{API_KEY}")

        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true

        request = Net::HTTP::Post.new(url)
        request["Content-Type"] = "application/x-www-form-urlencoded"
        request["Cookie"] = "__cfduid=d080f3df01c3305bfd53a06e5878efca31611341032"
        request.body = "text=#{params["userInput"]}"

        response = https.request(request).read_body

        render json: response
    end

    def get_quick_answer
        
        url = URI("https://api.spoonacular.com/recipes/quickAnswer?apiKey=#{API_KEY}&q=#{params["userInput"]}")

        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request["Cookie"] = "__cfduid=d080f3df01c3305bfd53a06e5878efca31611341032"

        response = https.request(request).read_body
        # byebug
        render json: response
    end

end
