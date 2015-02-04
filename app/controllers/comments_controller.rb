class CommentsController < ApplicationController
before_action :set_comment, only: [:new, :edit, :show, :destroy]

  def index
  	@comments = Comment.all 
  end

  def new
  	if current_user
     @comment = Comment.new
    else
      flash[:notice] = "Please sign in first."
      redirect_to signin_path
    end
  end

  def show
  end

  def edit
  end

  def create
  	@comment = Comment.create(comment_params)
    @comment.user = current_user
    @comment.post = current_post
    redirect_to @comment, notice: "Your comment has been posted."
  end

  def destroy
  	@comment.destroy
    redirect_to comments_path, notice: "Comment deleted."
  end

  private 

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:title, :body).merge(user_id: current_user.id)
  end










end

