class Recipe < ApplicationRecord
  
  belongs_to :user
  belongs_to :item
  
  has_many :recipe_comment, dependent: :destroy
  has_many :favorite, dependent: :destroy
  
end
