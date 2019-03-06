class LikesController < ApplicationController
  def create
    like = Like.create(user_id: current_user.id, tweet_id: params[:tweet_id])
    @tweet = like.tweet
    @id_name = "#like-link-#{@tweet.id}"
    @id_heart = "#favorited-icon-#{@tweet.id}"
    # redirect_to request.referrer || root_url
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    @tweet = like.tweet
    @id_name = "#like-link-#{@tweet.id}"
    @id_heart = "#favorited-icon-#{@tweet.id}"
    like.destroy
    # redirect_to request.referrer || root_url
  end
end
