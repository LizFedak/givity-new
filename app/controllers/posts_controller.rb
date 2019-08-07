class PostsController < ApplicationController

  before_action :load_post, only: [:show, :edit, :destroy, :update]

  def index
    @posts = Post.all
  end

  def my_index
    @posts = current_user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
  
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
    if @post.update(post_params)
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

  private def post_params
    params.require(:post).permit(:title, :body)
  end

  private def load_post
    @post = Post.find_by(id: params[:id])

    unless @post
      redirect_to posts_path, alert: 'Post Not found !!'
    end
  end
end
