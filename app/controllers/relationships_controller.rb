class RelationshipsController < ApplicationController
	

  def create
  	 @relationship = Relationship.create(follower_id: current_user.id, followed_id: params[:id])
  	 @user = User.find(params[:id])
  	 redirect_to users_path, notice: 'User followed'
  end

  def destroy
  	@relationship = Relationship.find_by(follower_id: current_user.id, followed_id: params[:id])
    @relationship.destroy
    redirect_to users_path, notice: 'User Unfollowed'
  end

  def following?(other_user)
    following.include?(other_user)
  end
 
end
