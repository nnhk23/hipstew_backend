class Ingredient < ApplicationRecord
    has_many :user_ingres, dependent: :destroy
    has_many :users, through: :user_ingres
end
