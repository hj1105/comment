class HomeController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def create
    @post = Post.new
    @post.title = params[:title]
    @post.content = params[:content]
    
    @post.save
    
    # @h = Hashtag.new
    # @h.name = params[:hashtag]
    # @h.save
    
    # @post.hashtag << @h
    
    @h = params[:hashtag].split(",")
    @h.each do |tag|
      @new_tag = Hashtag.new
      @new_tag.name = tag
      @new_tag.save
    end
    
    redirect_to :back
  end
  
  def create_comment
    @comment = Comment.new
    @comment.content = params[:content]
    @comment.post_id = params[:post_id]
    @comment.save
    
    redirect_to :back
  end
end
