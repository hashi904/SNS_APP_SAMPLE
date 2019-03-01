class CommentsController < ApplicationController
  before_action :set_tweet
  def create
    @comment = @tweet.comments.new(comment_params)
    if @comment.save
      redirect_to tweet_path(params[:tweet_id])
    else
      redirect_to tweet_path(params[:tweet_id]), notice: 'メッセージを入力してください'
    end
  end
  def destroy
    comment = @tweet.comments.find(params[:id])
    comment.destroy if comment.user_id == current_user.id
    redirect_to tweet_path(params[:tweet_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id)
  end
  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
