class User < ApplicationRecord
    has_many :user_recipes, dependent: :destroy
    has_many :recipes, through: :user_recipes
    has_many :user_ingres, dependent: :destroy
    has_many :ingredients, through: :user_ingres
    has_secure_password
    validates :username, uniqueness: true
end
