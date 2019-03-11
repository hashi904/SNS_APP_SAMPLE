require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before do
    @user = FactoryBot.create(:user, id: 1, password: 'hogehoge', email: 'hoge@hoge', nickname: 'hogehoge', username: '@hogehoge')
    @tweet = FactoryBot.create(:tweet, id: 1, text: 'hoge', user_id: 1)
    @comment = FactoryBot.create(:comment, id: 1, comment: 'hoge', user_id: 1, tweet_id: 1)
  end

  describe '#create' do
    before do
      sign_in @user
    end

    # it 'create comment' do
    #   comment_params = FactoryBot.attributes_for(:comment, {comment: 'hoge', tweet_id: 1})
    #   expect{
    #     post :create, params: {tweet:
    #         {comment: comment_params }
    #     }
    #   }.to change(@tweet.comments, :count).by(1)
    # end
  end
end

