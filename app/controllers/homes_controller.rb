class HomesController < ApplicationController
  

  def top
    @all_ranks = Recipe.all
    @all_ranks = Recipe.find(Favorite.group(:recipe_id).order('count(recipe_id) desc').limit(5).pluck(:recipe_id))
  end

end
