class PostsController < ApplicationController
	 before_action :authenticate_user!, :only => [:new, :create, :update, :destroy]

	def index
		@posts = Post.all.page(params[:page]).per(10)
	end	

	def new
		@post = Post.new
	end	

	def create
		@post = current_user.posts.create(post_params)
		if @post.valid?
			redirect_to root_path
		else 
			render :new, :status => :unprocessable_entity
		end		
	end	

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
		@photo = Photo.new
	end	

	def edit
		@post = Post.find(params[:id])
	end	

	def update
		@post = Post.find(params[:id])

		if @post.user != current_user
			return render :text => 'Not allowed', :status => :forbidden
		end

		@post.update_attributes(post_params)
		if @post.valid?
			redirect_to root_path
		else 
			render :edit, :status => :unprocessable_entity
		end	
	end	

	def destroy
		@post = Post.find(params[:id])
		if @post.user != current_user
			return render :text => 'Not allowed', :status => :forbidden
		end
		
		@post.destroy
		redirect_to root_path	
	end	


	private

	def post_params
		params.require(:post).permit(:title, :description)
	end	

end
