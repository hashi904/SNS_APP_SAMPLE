class TweetsController < ApplicationController
  before_action :move_to_index,except: [:index]
  def new
    @tweet = Tweet.new
  end

  def index
    if user_signed_in?
      @user = current_user
      user_id = @user.id
      @following_users = @user.followings
      current_user_tweets = Tweet.where(user_id: user_id).order(created_at: :desc)
      @tweets = []
      @tweets.concat(current_user_tweets)
      if @following_users.present?
        @following_users.each do |user|
          tweets = Tweet.where(user_id: user.id).order(created_at: :desc)
          # if tweets != nil
          #取得したユーザーの投稿一覧の格納
          @tweets.concat(tweets)
          # end
        end
        
        @tweets = @tweets.sort_by{|tweet| tweet.created_at}.reverse
      end
    end

    @users = User.all.shuffle.first(3)
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
    @users = User.all.shuffle.first(3)
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
