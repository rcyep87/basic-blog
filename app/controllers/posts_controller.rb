class PostsController < ApplicationController

  def index
    render template: 'posts/index.html.erb', locals: { posts: Post.all }
  end

  def show
    render template: 'posts/show.html.erb', locals: { post: Post.find(params[:id]), comments: Comment.where(post_id: params[:id]) }
  end

  def new
    new_form = Post.all.map { |p| [p.title, p.body] }
    render template: 'posts/new.html.erb', locals: {
      new_form: Post.new,
    }
  end

  def create
    new_post = Post.new
    new_post.title = params.fetch(:new_post).fetch(:title)
    new_post.body  = params.fetch(:new_post).fetch(:body)
    new_post.published = false
    if new_post.save
      redirect_to posts_path(new_post)
    else
      redirect_to posts_path
    end
  end

end
