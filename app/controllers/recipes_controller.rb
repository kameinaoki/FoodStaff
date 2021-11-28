class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_q, only: [:index, :search]

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    #byebug
    if @recipe.save
      redirect_to recipe_path(@recipe.id), notice: 'レシピが投稿されました'
    else
      flash.now[:alert] = '－投稿に失敗しました－'
      render :new
    end
  end

  def index
    @recipes = Recipe.all.order(created_at: :desc)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_comment = RecipeComment.new
    @recipe_comments = @recipe.recipe_comments.order(created_at: :desc)
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
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
