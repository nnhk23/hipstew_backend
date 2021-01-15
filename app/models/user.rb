class User < ApplicationRecord
    has_many :user_recipes
    has_many :recipes, through: :user_recipes
    validates :username, uniqueness: true
    # validates :username, :name, presence: true
    has_secure_password
end
