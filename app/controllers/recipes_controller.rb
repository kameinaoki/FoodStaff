class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    #byebug
    @recipe.save
    redirect_to recipe_path(@recipe.id)
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_comment = RecipeComment.new
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def recipe_params
    params.require(:recipe).permit(:cooking_name, :recipe_image, :recipe_content)
  end
end
