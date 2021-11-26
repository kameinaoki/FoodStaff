class RecipeCommentsController < ApplicationController
  
  before_action :authenticate_user!
  
  def create
    recipe = Recipe.find(params[:recipe_id])
    recipe_comment = RecipeComment.new(recipe_comment_params)
    recipe_comment.user_id = current_user.id
    recipe_comment.recipe_id = recipe.id
    recipe_comment.save
    redirect_to recipe_path(recipe)
  end
  
  def destroy
    
  end
  
  
  private
  def recipe_comment_params
    params.require(:recipe_comment).permit(:comment_content)
  end
  
end
