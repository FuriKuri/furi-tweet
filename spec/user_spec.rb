require 'rspec'
require 'user'

describe 'Twitter User' do

  describe 'with a username' do
    before(:each) do
      @user = User.new
      @user.twitter_username = 'furikuri'
    end

    it 'provides the last five tweets from Twitter' do
      mock_tweet = double('tweet')
      tweets = [
          mock_tweet,
          mock_tweet,
          mock_tweet,
          mock_tweet,
          mock_tweet
      ]
      mock_tweet.should_receive(:text).and_return(
          'tweet1', 'tweet2', 'tweet3', 'tweet4', 'tweet5')
      Twitter.should_receive(:user_timeline).with('furikuri').and_return(tweets)
      @user.last_five_tweets.should == %w(tweet1 tweet2 tweet3 tweet4 tweet5)
    end
  end
end