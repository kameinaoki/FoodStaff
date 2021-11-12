class Recipe < ApplicationRecord
  
  attachment :recipe_image
  
  belongs_to :user
  # belongs_to :item
  
  has_many :recipe_comments, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  

  
end
