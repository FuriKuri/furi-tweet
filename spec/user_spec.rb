require 'rspec'
require 'user'

describe 'Twitter User' do

  describe "with a username" do
    before(:each) do
      @user = User.new
      @user.twitter_username = 'furikuri'
    end

    it "provides the last five tweets from Twitter" do
      tweets = [
          "RT @cemerick: Code reuse is an absolute fucking myth.",
          "Take the spider.io challenge. #spider_io http://t.co/XNmKQFSp",
          "RT @unclebobmartin: Are you learning a functional language?  You'd better be!  My favorite, at the moment, is Clojure.",
          "RT @zedshaw: RANDOM_STRING IS RANDOM: https://t.co/RWtiKrBa",
          "RT @RomyOnRuby: I AM SO FURIOUS @ THE STORM the moment is over I am going to TATTOO THE #CLOJURE METACIRCULAR EVALUATOR on my back!! htt ..."
      ]
      @user.last_five_tweets.should == tweets
    end
  end
end