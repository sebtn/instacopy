class PhotosController < ApplicationController
	 before_action :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		@post.photos.create(photo_params)
		redirect_to post_path(@post)

	end	

	private 

	def photo_params
			params.require(:photo).permit(:picture, :post_id)
	end 
end
