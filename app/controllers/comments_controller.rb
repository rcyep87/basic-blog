class CommentsController < ApplicationController
  
  def index
    render template: 'comments/index.html.erb', locals: { comments: Comment.all }
  end

end
