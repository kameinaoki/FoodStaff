class Item < ApplicationRecord
  
  has_many :review, dependent: :destroy
  has_many :recipe, dependent: :destroy
  
end
