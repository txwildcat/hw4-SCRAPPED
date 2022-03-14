class PostsController < ApplicationController

  def
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.place_id = params["place_id"]
  end

  def create
    if @current_user
      @post = Post.new(params["post"])
      @post.user_id = @current_user.id
      @post.save
    else
      flash[:notice] = "Please click Login above, then enter in your username and password to create your first place and make your first post!"
    end
    redirect_to "/places/#{@post.place.id}"
  end

end
