class RelationshipsController < ApplicationController

	def create
    	# buildはnewと同じ意味で、アソシエーションしながらインスタンスをnewする時に形式的に使われる。
		follow = current_user.active_relationships.build(follower_id: params[:user_id])
		follow.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
		follow.destroy
		redirect_back(fallback_location: root_path)
	end

	def follows
		@user = Relationship.find(following_id: params[:user_id])
	end

	def followers
		@user = Relationship.find(follower_id: params[:user_id])
	end

end
