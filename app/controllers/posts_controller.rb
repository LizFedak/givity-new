class PostsController < ApplicationController

  before_action :load_post, only: [:show, :edit, :destroy, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(permitted_params)
    if @post.save
      redirect_to post_path(@post), alert: 'Post created successfully !!'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(permitted_params)
      redirect_to post_path(@post), alert: 'Post Updated Successfully.'
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, alert: 'Post destroyed successfully.'
    else
      redirect_to posts_path, alert: 'Error occured while destroying.'
    end
  end

  private def permitted_params
    params.require(:post).permit(:title, :body)
  end

  private def load_post
    @post = Post.find_by(id: params[:id])

    unless @post
      redirect_to posts_path, alert: 'Post Not found !!'
    end
  end
end
