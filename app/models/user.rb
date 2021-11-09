class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :recipe, dependent: :destroy
  has_many :recipe_comment, dependent: :destroy
  has_many :review, dependent: :destroy
  has_many :favorite, dependent: :destroy
  
  
  
end
