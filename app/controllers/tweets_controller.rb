class TweetsController < ApplicationController
  before_action :move_to_index,except: [:index]
  def new
    @tweet = Tweet.new
  end

  def index
    if user_signed_in?
      @following_users = current_user.followings
      current_user_tweets = Tweet.where(user_id: current_user.id).order(created_at: :desc)
      @tweets = []
      @tweets.concat(current_user_tweets)
      if @following_users.present?
        @following_users.each do |user|
          tweets = Tweet.where(user_id: user.id).order(created_at: :desc)
          #取得したユーザーの投稿一覧の格納
          @tweets.concat(tweets)
        end

        @tweets = @tweets.sort_by{|tweet| tweet.created_at}.reverse
        @tweets = Kaminari.paginate_array(@tweets).page(params[:page]).per(20)
      end
    end

    @recommend_users = User.all.shuffle.first(3)
  end

  def search
    @tweets = Tweet.search(params[:text]).order(created_at: :desc).page(params[:page]).per(20)
    @recommend_users = User.all.shuffle.first(3)
  end

  def create
    @tweet = Tweet.create(image: tweet_params[:image],text: tweet_params[:text], user_id: current_user.id)
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @recommend_users = User.all.shuffle.first(3)
    @comments = @tweet.comments.order("created_at ASC").page(params[:page]).per(15)
    @comment = Comment.new
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
    redirect_to tweets_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:image, :text)
  end
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
