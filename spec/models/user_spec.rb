require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create" do

    it "is valid with id, password, email, nickname and username" do
      user = User.new(
        password: 'hogehoge',
        email: 'hoge@hoge',
        nickname: 'hogehoge',
        username: '@hogehoge'
        )
      expect(user).to be_valid
    end

    it "is invalid without email" do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without password" do
      user = User.new(password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without nickname" do
      user = User.new(nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without username" do
      user = User.new(username: nil)
      user.valid?
      expect(user.errors[:username]).to include("can't be blank")
    end

    it "is invalid with a duplicate email" do
      User.create(
        password: 'hogehoge',
        email: 'hoge@hoge',
        nickname: 'hogehoge',
        username: '@hogehoge'
        )
      user = User.new(
        password: 'hogehogehoge',
        email: 'hoge@hoge',
        nickname: 'hogehogehoge',
        username: '@hogehogehoge'
        )
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end

    it "is invalid with a duplicate username" do
      User.create(
        password: 'hogehoge',
        email: 'hoge@hoge',
        nickname: 'hogehoge',
        username: '@hogehoge'
        )
      user = User.new(
        password: 'hogehogehoge',
        email: 'hogehoge@hoge',
        nickname: 'hogehoge',
        username: '@hogehoge'
        )
      user.valid?
      expect(user.errors[:username]).to include("has already been taken")
    end

    it "is invalid with a password that has less or equal 4 characters" do
      user = User.new(password: "hoge")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    it "is invalid with a profile that has over 100 characters" do
      user = User.new(
        profile: "hogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehoge"
        )
      user.valid?
      expect(user.errors[:profile])
    end
  end
end
