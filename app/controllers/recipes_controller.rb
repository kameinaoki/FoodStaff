class RecipesController < ApplicationController
  before_action :set_q, only: [:index, :search]

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
    @recipe_comments = RecipeComment.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    @results = @q.result
  end
  
  
  private
  
  def set_q
    @q = Recipe.ransack(params[:q])
  end

  def recipe_params
    params.require(:recipe).permit(:cooking_name, :recipe_image, :recipe_content)
  end
end
