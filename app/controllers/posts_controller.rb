class PostsController < ApplicationController

  def index
    posts = Post.all
    render template: 'posts/index.html.erb', locals: { posts: posts }
  end

end
