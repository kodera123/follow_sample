class RelationshipsController < ApplicationController
	before_action :authenticate_user!

	def create
		@user = User.find(params[:user_id])
		if @user.inverse_follows.create(follower: current_user)
			redirect_to post_url, notice: "フォローしました"
		else
			redirect_to post_url, alert: "フォローできません"
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		follow = current_user.inverse_follows.find_by!(follower: current_user)
		follow.destroy
		redirect_to posts_url, notice: "フォロー解除しました"
	end
end
