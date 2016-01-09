class PhotosController < ApplicationController
	 before_action :authenticate_user!

	def create
		@post = Post.find(params[:id])
		@post.photo.create(photo_params)

	end	

	private 

	def photo_params
			params.require(:photo).permit(:picture, :post_id)
	end 
end
