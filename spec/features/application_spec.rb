require 'rails_helper'

RSpec.feature "application", type: :feature do
  scenario "user log in and create tweet" do

    user = User.create(
      password: 'hogehogehoge',
      email: 'hogehoge@hoge',
      nickname: 'hogehoge',
      username: '@hogehoge'
    )
    #log in as user1
    visit root_path
    click_link"Login"
    fill_in "Email", with: "hogehoge@hoge"
    fill_in "Password", with: "hogehogehoge"
    click_button "Log in"

    expect{
      click_on(class: 'main-content-func-tweet__link')
      find(".tweet-box-main-top-content__text_area").set("hoge")
      click_button "ツイート"

      expect(page).to have_css ".main-content-tweet-user-box-func-message__link"
    }.to change(user.tweets, :count).by(1)
  end

  scenario "user2 follows user1 and comments user1's tweet" do
    user1 = User.create(
      id: 1,
      password: 'hogehogehoge',
      email: 'hogehoge@hoge',
      nickname: 'hogehoge',
      username: '@hogehoge'
    )
    user2 = User.create(
      id: 2,
      password: 'hogehoge',
      email: 'hoge@hoge',
      nickname: 'hoge',
      username: '@hoge'
    )
    tweet = Tweet.create(
      text: 'hogegoge',
      user_id: 1
    )
    #log in as user2
    visit root_path
    click_link"Login"
    fill_in "Email", with: "hoge@hoge"
    fill_in "Password", with: "hogehoge"
    click_button "Log in"

    #following user1
    click_on(class: 'right-side-user')
    click_on(class: 'users-main-main__follow-btn')
    click_on(class: 'global__left-home-menu')

    #create comment
    expect{
      click_on(class: 'main-content-tweet-user-box-func-message__link')
      find(".main-top__comment-create-box-content__textarea").set("hoge")
      click_button "コメントする"

      expect(page).to have_css ".main-content-tweet-user-box-text"
    }.to change(tweet.comments, :count).by(1)

  end
end
