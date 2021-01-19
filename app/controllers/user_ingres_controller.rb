class UserIngresController < ApplicationController
    skip_before_action :authorized

    def create
        user_ingre = UserIngre.create(user_ingre_params)
        render json: user_ingre
    end

    def destroy
        user_ingre = UserIngre.find(params[:id])
        user_ingre.destroy
        render json: user_ingre
    end

    private
    def user_ingre_params
        params.permit(:user_id, :ingredient_id)
    end
end
