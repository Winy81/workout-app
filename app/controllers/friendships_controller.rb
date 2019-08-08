class FriendshipsController < ApplicationController
 
  before_action :authenticate_user!

  def create
    friend = User.find(params[:friend_id])
    params[:user_id] = current_user.id
    
    Friendship.create(friendship_params) unless current_user.follows_or_same?(friend)
    redirect_to root_path
  end

end