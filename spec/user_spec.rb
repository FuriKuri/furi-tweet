require 'rspec'
require 'user'

describe 'Twitter User' do

  describe "with a username" do
    before(:each) do
      @user = User.new
      @user.twitter_username = 'furikuri'
    end

    it "provides the last five tweets from Twitter" do
      @user.last_five_tweets.should have(5).tweets
    end
  end
end