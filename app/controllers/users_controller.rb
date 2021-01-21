class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :login, :update, :index, :destroy]

    def index
        users = User.all
        render json: users
    end

    def create
        user = User.new(user_params)
        if user.save
            token = encode_token({user_id: user.id})
            render json: {user: user, token: token}
        else
            render json: {error: "Username has already been taken. Please try again."}
        end
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            token = encode_token({user_id: user.id})
            render json: {user: user, token: token}
        else
            render json: user.errors
        end
    end
    
    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: user
    end

    def login
        user = User.find_by(username: params[:username])
        # byebug
        if user && user.authenticate(params[:password])
            token = encode_token({user_id: user.id})
            render json: {user: user, token: token}
        else
            render json: {error: "Incorrect credentials, please try again."}
        end
    end

    def get_user
        render json: {user: UserSerializer.new(current_user)}
    end

    private

    def user_params
      params.permit(:username, :password, :name)
    end

end
