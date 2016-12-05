class ForumsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  before_action :admin_user,     only: :destroy

  def index
    @forums = Forum.paginate(page: params[:page])
  end
  
  def show
    @forum = Forum.find(params[:id])
    @forum_comments = @forum.forum_comments.paginate(page: params[:page])
    @forum_comment = ForumComment.new
  end

  def new
    @forum = Forum.new
  end

  def create
    @forum = Forum.new(forum_params)
    if @forum.save
      flash[:info] = "created forum"
      redirect_to @forum
    else
      render 'new'
    end
  end

  def destroy
    Forum.find(params[:id]).destroy
    flash[:success] = "forum deleted"
    redirect_to forums_url
  end

  private

  def forum_params
    params.require(:forum).permit(:title, :user_id)
  end
end
