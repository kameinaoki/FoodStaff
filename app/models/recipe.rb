class Recipe < ApplicationRecord

  attachment :recipe_image

  belongs_to :user
  # belongs_to :item

  has_many :recipe_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :cooking_name, presence: true
  validates :recipe_content, presence: true
  validates :recipe_image, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end



end
