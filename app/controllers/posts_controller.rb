class PostsController < ApplicationController
  def show
  end

  def index    
    if params[:sort] == 'completed'
      sort_by_completed
    elsif params[:sort] == 'priority'
      sort_by_priority
    else
      @posts = Post.all
    end

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :catagory, :priority, :completed)
    end

    def sort_by_completed
      @posts = Post.all.sort_by {|x| x.completed ? 10 : 20 }
    end

    def sort_by_priority
      @posts = sort_words(Post.all)
    end

    def sort_words(posts)
      posts.sort_by {|x| get_integer_from_priority(x.priority) }
    end

    def get_integer_from_priority(value)
      if value == "Low"
        10
      elsif value == "Medium"
        20
      elsif value == "High"
        30
      end
    end
end






