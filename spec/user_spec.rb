require 'rspec'
require 'user'

describe 'Twitter User' do

  describe 'with a username' do
    before(:each) do
      @user = User.new
      @user.twitter_username = 'furikuri'
    end

    it 'provides the last five tweets from Twitter' do
      mock_tweet1 = double('tweet1')
      mock_tweet2 = double('tweet2')
      mock_tweet3 = double('tweet3')
      mock_tweet4 = double('tweet4')
      mock_tweet5 = double('tweet5')
      tweets = [
          mock_tweet1,
          mock_tweet2,
          mock_tweet3,
          mock_tweet4,
          mock_tweet5
      ]
      mock_tweet1.should_receive(:text).and_return('tweet1')
      mock_tweet2.should_receive(:text).and_return('tweet2')
      mock_tweet3.should_receive(:text).and_return('tweet3')
      mock_tweet4.should_receive(:text).and_return('tweet4')
      mock_tweet5.should_receive(:text).and_return('tweet5')
      Twitter.should_receive(:user_timeline).with('furikuri').and_return(tweets)
      @user.last_five_tweets.should == %w(tweet1 tweet2 tweet3 tweet4 tweet5)
    end
  end
end