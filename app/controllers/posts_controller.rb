class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @post = Post.new  # had to add in order for form to work with new.html.erb (look at the form and edit)
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

  def destroy 
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  def tagged
    @tag = Tag.find_by(name: params[:name])
    @posts = @tag.posts
    render :tagged
  end

end



