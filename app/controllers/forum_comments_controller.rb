class ForumCommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :admin_user,     only: :destroy

  def create
    @forum_comment = ForumComment.new(comment_params)
    if @forum_comment.save
      flash[:success] = "Comment created!"
      redirect_to @forum_comment.forum
    else
      render 'static_pages/home'
    end
  end

  def destroy
    ForumComment.find(params[:id]).destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || root_url
  end

  private

  def comment_params
    params.require(:forum_comment).permit(:body, :user_id, :forum_id)
  end

end
