class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  expose(:posts)
  expose(:post)

  def index
    posts = Post.all
  end

  def create
    post = Post.new(params["post"])
    post.user = current_user
    if post.save
      redirect_to post
    else
      flash.now[:error] = params.to_s + post.inspect
      render 'new'
    end
  end

  def new
    post = Post.new
  end

  def edit
    post = Post.find_by_id(params[:id])
    redirect_to root_url if post.nil?
  end

  def show
    post = Post.find_by_id(params[:id])
    redirect_to root_url if post.nil?
  end

  def update
    post = Post.new(params[:post])
    if post.save
      redirect_to post
    else
      render 'edit'
    end
  end

  def destroy
    post = Post.find_by_id(params[:id])
    redirect_to root_url if post.nil?
    post.delete
    redirect_to root_url
  end
end
