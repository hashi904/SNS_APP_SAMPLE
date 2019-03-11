require 'rails_helper'

RSpec.describe TweetsController, type: :controller do

  before do
    @user = FactoryBot.create(:user, id: 1, password: 'hogehoge', email: 'hoge@hoge', nickname: 'hogehoge', username: '@hogehoge')
  end

  describe '#index' do

    context 'when user signed in' do
      before do
        sign_in @user
      end

      it 'request is 200' do
        expect(response.status).to eq 200
      end

      it 'assigns the requested tweet to @tweet' do
        expect(assigns(:tweets)).to match(@tweets)
      end

      it 'assigns the requested recommend_users @recommend_users' do
        expect(assigns(:users)).to match(@recommend_users)
      end
    end
  end

  describe '#create' do

    before do
      sign_in @user
    end

    context 'user sigin && tweet created' do

      it 'create tweet only text' do
        tweet_params = FactoryBot.attributes_for(:tweet, {text: 'hoge'})
        expect{
          post :create, params: { tweet: tweet_params }
        }.to change(@user.tweets, :count).by(1)
      end

      it 'create tweet with image' do
        tweet_params = FactoryBot.attributes_for(:tweet, {text: 'hoge', image: 'hoge.png'})
        expect{
          post :create, params: { tweet: tweet_params }
        }.to change(@user.tweets, :count).by(1)
      end

      it 'request is 302' do
        tweet_params = FactoryBot.attributes_for(:tweet, {text: 'hoge'})
        post :create, params: { tweet: tweet_params }
        expect(response).to have_http_status "302"
      end

      it 'redirects to the tweets_path' do
        tweet_params = FactoryBot.attributes_for(:tweet, {text: 'hoge'})
        post :create, params: { tweet: tweet_params }
        expect(response).to redirect_to tweets_path
      end
    end

    context 'user sigin && tweet could not create' do

      it 'could not create tweet' do
        tweet_params = FactoryBot.attributes_for(:tweet, {text: ''})
        expect{
          post :create, params: { tweet: tweet_params }
        }.to_not change(@user.tweets, :count)
      end
    end
  end

  describe '#show' do
    it 'assigns the requested tweet to @tweet' do
      expect(assigns(:tweets)).to match(@tweet)
    end

    it 'assigns the requested recommend_users to @recommend_users' do
        expect(assigns(:users)).to match(@recommend_users)
    end

    it 'assigns the requested comments to @comments' do
        expect(assigns(:comments)).to match(@comments)
    end

    # it 'responds successfully' do
    #   get :show, params: { id: @tweet1.id }
    #   expect(response).to be_success
    # end
  end

  describe '#delete' do
    before do
      sign_in @user
    end

    it 'delete tweet' do
      tweet = create(:tweet, {text: 'hoge', user_id: 1})
      expect{
        delete :destroy, id: tweet
      }.to change(Tweet, :count).by(-1)
    end
  end
end
