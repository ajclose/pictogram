class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update
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
    @post.destroy
    flash[:success] = "Post deleted!"
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
