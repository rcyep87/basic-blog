class CommentsController < ApplicationController

  def index
    render template: 'comments/index.html.erb', locals: { comments: Comment.all }
  end

  def new
    render template: 'posts/show.html.erb', locals: {
      new_comment: Comment.new
    }
  end

  def create
    new_comment = Comment.new
    new_comment.message = params.fetch(:comment).fetch(:message)
    new_comment.post_id = params.fetch(:comment).fetch(:post_id)
    if new_comment.save
      redirect_to post_path(params[:id])
    else
      redirect_to root_path
    end
  end

end
