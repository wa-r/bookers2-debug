class RelationshipsController < ApplicationController

  def create
    user = User.find(params[:followed_id]) #フォローする相手
    current_user.follow(user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    user = Relationship.find(params[:id]).followed#フォローしていた相手
    current_user.unfollow(user)
    redirect_back(fallback_location: root_path)
  end
  
end