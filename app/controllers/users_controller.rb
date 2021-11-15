class UsersController < ApplicationController
  before_action :set_user, only: [:favorites]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
  end

  def favorites
    favorites = Favorite.where(user_id: @user.id).pluck(:recipe_id)
    @favorite_recipes = Recipe.find(favorites)
  end


  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def set_user
    @user = User.find(params[:id])
  end

end
