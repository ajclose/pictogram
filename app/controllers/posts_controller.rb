class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Your post was successfully created"
      redirect_to @post
    else
      flash[:alert] = "Image required"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      flash[:success] = "Post updated!"
      redirect_to @post
    else
      flash[:alert] = "There's an error!"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "Post deleted!"
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
