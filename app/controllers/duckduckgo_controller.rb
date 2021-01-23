require "duck_duck_go"

class DuckduckgoController < ApplicationController
    skip_before_action :authorized

    def get_result
        byebug
        ddg = DuckDuckGo.new
        if params["userInput"].include? (' ')
            searchTerm = params["userInput"].split(' ').join('-')
        end
        byebug


        data = ddg.zeroclickinfo(searchTerm)
        byebug
        
        render json: data
    end

end
