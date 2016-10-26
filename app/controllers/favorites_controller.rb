class FavoritesController < ApplicationController
	before_action :authenticate_user!
	def create
        @post = Post.find(params[:post_id])
        @favorite = current_user.favorites.build(post: @post)
 
        if @favorite.save
          respond_to do |format|
            format.html { redirect_to posts_url, notice: "成功です" }
            format.js
          end
        else
          redirect_to posts_url, alert: "この投稿はお気に入りに登録できません"
        end
    end

    def destroy
    	@favorite = current_user.favorites.find_by!(post_id: params[:post_id])
    	@favorite.destroy
    	redirect_to posts_url, notice: "お気に入りを解除しました"
    end
end
