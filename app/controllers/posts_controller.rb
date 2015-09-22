class PostsController < ApplicationController

  def index
    render template: 'posts/index.html.erb', locals: { posts: Post.all }
  end

  def show
    render template: 'posts/show.html.erb', locals: { post: Post.find(params[:id]), comments: Comment.where(post_id: params[:id]) }
  end

end
