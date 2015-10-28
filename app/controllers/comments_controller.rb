class CommentsController < ApplicationController
  def create
    # @comment = Comment.create(post_id: params[:id],
    #                           content: params[:comment])
    @post = Post.find(params[:id])
    @post.comments.create!(content: params[:comment])
    redirect_to post_path(@post)
  end
end