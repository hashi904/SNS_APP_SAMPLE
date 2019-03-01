class TweetsController < ApplicationController
  before_action :move_to_index,except: [:index]
  def new
    @tweet = Tweet.new
  end

  def index
    @tweets =Tweet.order("created_at DESC")
  end

  def create
    @tweet = Tweet.create(image: tweet_params[:image],text: tweet_params[:text], user_id: current_user.id)
    if @tweet.save
      redirect_to "/"
    else
      flash.now[:danger] = '文字を入力してください'
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.order("created_at DESC")
    @comment = Comment.new
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
    redirect_to "/"
  end

  private
  def tweet_params
    params.require(:tweet).permit(:image, :text)
  end
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
