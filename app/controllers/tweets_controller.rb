class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def index
    @tweets =Tweet.order("created_at DESC")
  end

  def create
    @tweet = Tweet.create(image: tweet_params[:image],text: tweet_params[:text])
    if @tweet.save
      redirect_to "/"
    else
      flash[:danger] = '文字を入力してください'
      render "new"
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:image, :text)
  end
end
