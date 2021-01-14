class UsersController < ApplicationController

    def index
        users = User.all
        render json: users, except: [:created_at, :updated_at]
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: {user: user}, except: [:created_at, :updated_at]
        else
            render json: user.errors, except: [:created_at, :updated_at]
        end
    end

    def login

    end

    private

    def user_params
      params.permit(:username, :password, :name)
    end

end
