class PostsController < ApplicationController
  
  def new
    @post.new
    render :new
  end

  def create
    post = Post.create(title: params[:title],
                       content: params[:content],
                       written_at: DateTime.now)
    redirect_to post_path(post)
  end

  def index
    @posts = Post.page(params[:page]).per(10)
    render :index  #  index is erb file with contents that will be displayed 
  end

  def show
    @post = Post.find(params[:id])
    render :show    # show is erb file with contents that wil be displayed 
  end

  def edit 
    @post = Post.find(params[:id])
    render :edit  
  end

  def update
    post = Post.find(params[:id])
    post.update(title: params[:title], content: params[:content])
    redirect_to post_path(post)
  end

end



