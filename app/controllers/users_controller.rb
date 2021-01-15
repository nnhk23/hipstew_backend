class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :login]

    def index
        users = User.all
        render json: users, except: [:created_at, :updated_at]
    end

    def create
        user = User.new(user_params)
        if user.save
            token = encode_token({user_id: user.id})
            render json: {user: user, token: token}, except: [:created_at, :updated_at]
        else
            render json: user.errors, except: [:created_at, :updated_at]
        end
    end

    def login
        user = User.find_by(username: params[:username])
        # byebug
        if user && user.authenticate(params[:password])
            token = encode_token({user_id: user.id})
            render json: {user: user, token: token}, except: [:created_at, :updated_at]
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
