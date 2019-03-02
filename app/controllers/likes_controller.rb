class LikesController < ApplicationController
  before_action :logged_in_user
  def create
    @tweet = Tweet.find(params[tweet_id])
    @tweet.iine(current_user)
  end

  def destroy
    @tweet = Like.find(param[:id]).tweet
    @tweet.uniine(current_user)
  end
end
